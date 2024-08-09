#pragma once

#include <memory>
#include <vamp/collision/environment.hh>
#include <vamp/planning/nn.hh>
#include <vamp/planning/plan.hh>
#include <vamp/planning/validate.hh>
#include <vamp/planning/rrt_star_settings.hh>
#include <vamp/random/halton.hh>
#include <vamp/utils.hh>
#include <vamp/vector.hh>
#include <cmath>

namespace vamp::planning
{
    template <typename Robot, typename RNG, std::size_t rake, std::size_t resolution>
    struct RRT_star
    {
        using Configuration = typename Robot::Configuration;
        static constexpr auto dimension = Robot::dimension;
        static constexpr auto space_measure = Robot::space_measure;

        inline static auto solve(
            const Configuration &start,
            const Configuration &goal,
            const collision::Environment<FloatVector<rake>> &environment,
            const RRT_star_settings &settings) noexcept -> PlanningResult<dimension>
        {
            return solve(start, std::vector<Configuration>{goal}, environment, settings);
        }

        inline static auto solve(
            const Configuration &start,
            const std::vector<Configuration> &goals,
            const collision::Environment<FloatVector<rake>> &environment,
            const RRT_star_settings &settings
        ) -> PlanningResult<dimension>
        {
            PlanningResult<dimension> result;
            NN<dimension> tree;
            constexpr const std::size_t start_index = 0;

            auto buffer = std::unique_ptr<float, decltype(&free)>(
                vamp::utils::vector_alloc<float, FloatVectorAlignment, FloatVectorWidth>(
                    settings.max_samples * Configuration::num_scalars_rounded
                ),
                &free
            );

            const auto buffer_index = [&buffer](std::size_t index) -> float *
            {
                return buffer.get() + index * Configuration::num_scalars_rounded;
            };

            std::vector<std::size_t> parents(settings.max_samples);
            std::vector<float> cost(settings.max_samples);
            auto start_time = std::chrono::steady_clock::now();

            for (const auto &goal : goals)
            {
                if (validate_motion<Robot, rake, resolution>(start, goal, environment))
                {
                    result.path.emplace_back(start);
                    result.path.emplace_back(goal);
                    result.nanoseconds = vamp::utils::get_elapsed_nanoseconds(start_time);
                    result.iterations = 0;
                    result.size.emplace_back(1);
                    return result;
                }
            }

            RNG rng(settings.rng_skip_iterations);
            std::size_t free_index = start_index + 1;

            start.to_array(buffer_index(start_index));
            tree.insert(NNNode<dimension>{start_index, {buffer_index(start_index)}});
            parents[start_index] = start_index;
            cost[start_index] = 0.0;

            // main loop
            std::size_t iter = 0;
            float unit_ball_volume = unitNballMeasure(dimension);
            while (iter++ < settings.max_iterations and free_index < settings.max_samples) {

                // sample random config
                auto sample_config = rng.next();
                Robot::scale_configuration(sample_config);
                typename Robot::ConfigurationBuffer sample_config_arr;
                sample_config.to_array(sample_config_arr.data());

                const auto nearest = tree.nearest(NNFloatArray<dimension>{sample_config_arr.data()});
                if (not nearest)
                {
                    continue;
                }

                // steer (calculate next state within range)
                const auto &[nearest_node, nearest_distance] = *nearest;
                auto nearest_configuration = nearest_node.as_vector();
                auto nearest_vector = sample_config - nearest_configuration;

                bool reach = nearest_distance < settings.range;
                auto extension_vector = (reach) ? nearest_vector : nearest_vector * (settings.range / nearest_distance);

                if (validate_vector<Robot, rake, resolution>(
                    nearest_configuration,
                    extension_vector,
                    (reach) ? nearest_distance : settings.range,
                    environment
                ))
                {
                    // insert new config into vertex set
                    float *new_configuration_index = buffer_index(free_index);
                    auto new_configuration = nearest_configuration + extension_vector;
                    new_configuration.to_array(new_configuration_index);
                    tree.insert(NNNode<dimension>{free_index, {new_configuration_index}});

                    // sample points in graph within radius r of new config
                    // https://github.com/UNC-Robotics/nigh?tab=readme-ov-file#searching
                    float free_volume = space_measure();
                    std::size_t card = tree.size();
                    float dim_recip = 1.0 / dimension;
                    // https://github.com/ompl/ompl/blob/af4d6d625e15a4ed6d85255c718ce26bcd79e4cc/src/ompl/geometric/planners/rrt/src/RRTstar.cpp#L1168C5-L1168C11
                    float gamma_rrt = pow(2 * (1.0 + 1.0 / dimension) * (free_volume / unit_ball_volume), dim_recip);
                    float rrt_radius = std::fmin(
                        gamma_rrt * pow((log(card) / card), dim_recip),
                        settings.range
                    );
                    // tree.nearest returns a vector of pair<Node, Distance>
                    // https://github.com/UNC-Robotics/nigh?tab=readme-ov-file#searching
                    std::vector<std::pair<NNNode<dimension>, float>> near;
                    tree.nearest(near, NNFloatArray<dimension>{sample_config_arr.data()}, 1000, rrt_radius);

                    
                    // initialize variables to keep track of the min cost neighbor and the cost of that neighbor
                    auto min_neighbor = nearest_node;
                    float min_cost = cost[nearest_node.index] + nearest_distance;

                    // loop through near neighbors, find the one that gives us min cost from root
                    std::vector<bool> collision_free(near.size());
                    std::size_t idx = 0;
                    for (auto &[node, distance] : near) {
                        auto configuration = node.as_vector();
                        auto extension_vector = new_configuration - configuration;
                        collision_free[idx] = validate_vector<Robot, rake, resolution>(
                            configuration,
                            extension_vector,
                            distance,
                            environment
                        );
                        float cur_cost = cost[node.index] + distance;
                        if ((cur_cost < min_cost) && collision_free[idx]) {
                            min_cost = cur_cost;
                            min_neighbor = node;
                        }
                        idx++;
                    }

                    // add an edge from min cost neighbor to new config
                    parents[free_index] = min_neighbor.index;
                    cost[free_index] = min_cost;
                    
                    // rewire with our newly added node to see if any neighbors can be routed through it
                    // to get a shorter path to that neighbor
                    idx = 0;
                    for (auto &[node, distance] : near) {
                        if ((min_cost + distance < cost[node.index]) && collision_free[idx]) {
                            parents[node.index] = free_index;
                        }
                        idx++;
                    }

                    free_index++;
        
                    bool goal_reached = false;
                    // check if we can reach a goal
                    for (const auto &goal : goals)
                    {
                        if (validate_motion<Robot, rake, resolution>(new_configuration, goal, environment))
                        {
                            auto current = free_index - 1;
                            result.path.emplace_back(goal);
                            while(parents[current] != current) // loop until we hit the root node
                            {
                                auto parent = parents[current];
                                result.path.emplace_back(buffer_index(parent));
                                auto N = result.path.size();
                                result.cost += result.path[N - 1].distance(result.path[N - 2]);
                                current = parent;
                            }
                            std::reverse(result.path.begin(), result.path.end());
                            goal_reached = true;
                            break;
                        }
                    }
                    if (goal_reached) break;
                }
            }

            result.nanoseconds = vamp::utils::get_elapsed_nanoseconds(start_time);
            result.iterations = iter;
            result.size.emplace_back(tree.size());
            return result;
        }

        inline static auto unitNballMeasure(unsigned int N) -> float
        {
            return std::pow(std::sqrt(M_PI), N) / std::tgamma(N / 2.0 + 1.0);
        }
    };
}