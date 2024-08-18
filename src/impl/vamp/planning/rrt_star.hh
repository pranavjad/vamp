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
#include <iostream>

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

            std::vector<std::size_t> parent(settings.max_samples);
            std::vector<std::vector<std::size_t>> children(settings.max_samples, std::vector<std::size_t>());
            std::vector<float> cost(settings.max_samples, -1.0);

            const auto add_edge = [&parent, &children](std::size_t parent_node, std::size_t child_node) -> void
            {
                parent[child_node] = parent_node;
                children[parent_node].push_back(child_node);
            };
            const auto remove_edge = [&parent, &children](std::size_t parent_node, std::size_t child_node) -> void
            {
                parent[child_node] = -1;
                auto it = std::find(children[parent_node].begin(), children[parent_node].end(), child_node);
                if (it != children[parent_node].end()) children[parent_node].erase(it);
            };
            std::function<void(std::size_t)> update_children = [&cost, &children, &buffer_index, &update_children](std::size_t idx)
            {
                Configuration cur(buffer_index(idx));
                for (auto &child : children[idx]) {
                    cost[child] = cost[idx] + cur.distance(buffer_index(child));
                    update_children(child);
                }
            };

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

            // add start to tree
            start.to_array(buffer_index(start_index));
            tree.insert(NNNode<dimension>{start_index, {buffer_index(start_index)}});
            parent[start_index] = start_index;
            cost[start_index] = 0.0;

            std::vector<std::pair<std::size_t, Configuration>> goal_motions;
            float best_path_cost = std::numeric_limits<float>::max();
            std::pair<std::size_t, Configuration> best_goal_motion;
            // main loop
            std::size_t iter = 0;
            float unit_ball_volume = unitNballMeasure(dimension);
            std::vector<std::pair<NNNode<dimension>, float>> near;
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
                // std::cout << "nearest_node cost: " << cost[nearest_node.index] << "\n";
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
                    float *new_configuration_ptr = buffer_index(free_index);
                    auto new_configuration = nearest_configuration + extension_vector;
                    new_configuration.to_array(new_configuration_ptr);
                    NNNode<dimension> new_node({free_index, {new_configuration_ptr}});
                    // tree.insert(new_node);

                    // sample points in graph within radius r of new config
                    // https://github.com/UNC-Robotics/nigh?tab=readme-ov-file#searching
                    float free_volume = space_measure();
                    std::size_t card = tree.size() + 1; //plus 1 to account for the new configuration not inserted yet
                    float dim_recip = 1.0 / dimension;
                    // https://github.com/ompl/ompl/blob/af4d6d625e15a4ed6d85255c718ce26bcd79e4cc/src/ompl/geometric/planners/rrt/src/RRTstar.cpp#L1168C5-L1168C11
                    float gamma_rrt = pow(2 * (1.0 + 1.0 / dimension) * (free_volume / unit_ball_volume), dim_recip);
                    float rrt_radius = settings.range;
                    // float rrt_radius = std::fmin(
                    //     settings.rewire_factor * gamma_rrt * pow((log(card) / card), dim_recip),
                    //     settings.range
                    // );
                    // tree.nearest returns a vector of pair<Node, Distance>
                    // https://github.com/UNC-Robotics/nigh?tab=readme-ov-file#searching
                    
                    tree.nearest(near, NNFloatArray<dimension>{new_configuration_ptr}, 10000, rrt_radius);
                    // tree.nearest(near, NNFloatArray<dimension>{new_configuration}, 10000, rrt_radius);
                    // std::cout << "near.size(): " << near.size() << "\n";
                    
                    // initialize variables to keep track of the min cost neighbor and the cost of that neighbor
                    auto min_neighbor = nearest_node;
                    float min_cost = cost[nearest_node.index] + nearest_distance;

                    // loop through near neighbors, find the one that gives us min cost from root
                    std::vector<bool> collision_free(near.size());
                    std::size_t idx = 0;
                    for (auto &[node, distance] : near) {
                        auto configuration = node.as_vector();
                        auto extension_vector = new_configuration - configuration;
                        collision_free[idx] = validate_motion<Robot, rake, resolution>(
                            configuration, new_configuration, environment
                        );
                        // collision_free[idx] = validate_vector<Robot, rake, resolution>(
                        //     configuration,
                        //     extension_vector,
                        //     distance,
                        //     environment
                        // );
                        float cur_cost = cost[node.index] + distance;
                        // std::cout << "cost[nbh]: " << cost[node.index] << ", dist to nbh: " << distance << "\n";
                        if ((cur_cost < min_cost) && collision_free[idx]) {
                            min_cost = cur_cost;
                            min_neighbor = node;
                        }
                        idx++;
                    }

                    // add an edge from min cost neighbor to new config
                    tree.insert(new_node);
                    add_edge(min_neighbor.index, free_index);
                    cost[free_index] = min_cost;
                    
                    // rewire with our newly added node to if we can use it to get a shorter path
                    // to any of it's neighbors
                    idx = 0;
                    bool check_new_best = false;
                    for (auto &[node, distance] : near) {
                        if ((min_cost + distance < cost[node.index]) && collision_free[idx]) {
                            remove_edge(parent[node.index], node.index);
                            add_edge(free_index, node.index);

                            // propgate saved cost to children
                            cost[node.index] = min_cost + distance;
                            // std::cout << "new cost: " << cost[node.index] << "\n";
                            update_children(node.index);
                            check_new_best = true;
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
                            if (!settings.force_max_iters) { // found a solution, exit the algorithm
                                auto current = free_index - 1;
                                result.path.emplace_back(goal);
                                result.path.emplace_back(new_configuration);
                                result.cost = cost[current] + goal.distance(buffer_index(current));
                                while(parent[current] != current) // build path
                                {
                                    auto parent_node = parent[current];
                                    result.path.emplace_back(buffer_index(parent_node));
                                    current = parent_node;
                                }
                                std::reverse(result.path.begin(), result.path.end());
                                goal_reached = true;
                                break;
                            }
                            else {
                                auto current = free_index - 1;
                                goal_motions.push_back({current, goal});
                                check_new_best = true;
                            }
                        }
                    }
                    if (!settings.force_max_iters && goal_reached) break;
                    if (settings.force_max_iters && check_new_best) {
                        // loop through goal nodes to find the best solution
                        for (auto &[end_node_idx, goal]: goal_motions) {
                            float cur_cost = cost[end_node_idx] + goal.distance(buffer_index(end_node_idx));
                            // std::cout << "potential new best cost: " << cur_cost << ", best cost: " << best_path_cost << "\n";
                            if (cur_cost < best_path_cost) {
                                best_path_cost = cur_cost;
                                best_goal_motion = {end_node_idx, goal};
                                std::cout << "New best path found with cost: " << best_path_cost << " at iter " << iter << std::endl;                   
                            }
                        }
                    }
                }
            }
            if (!settings.force_max_iters) {
                result.nanoseconds = vamp::utils::get_elapsed_nanoseconds(start_time);
                result.iterations = iter;
                result.size.emplace_back(tree.size());
                return result;
            }
            if (goal_motions.size() > 0) {
                result.cost = best_path_cost;
                auto &[best_end_node_idx, best_goal] = best_goal_motion;
                result.path.emplace_back(best_goal);
                result.path.emplace_back(buffer_index(best_end_node_idx));
                auto current = best_end_node_idx;
                while(parent[current] != current) // build path
                {
                    auto parent_node = parent[current];
                    result.path.emplace_back(buffer_index(parent_node));
                    current = parent_node;
                }
                // result.path.emplace_back(start);
                std::reverse(result.path.begin(), result.path.end());
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