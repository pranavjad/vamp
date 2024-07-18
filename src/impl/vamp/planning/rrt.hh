/*
 * RRT implementation excercise.
 * Author: Pranav Jadhav
 * Version: Jul 16, 2024
 */

#pragma once

#include <memory>

#include <vamp/collision/environment.hh>
#include <vamp/planning/nn.hh>
#include <vamp/planning/plan.hh>
#include <vamp/planning/validate.hh>
#include <vamp/planning/rrt_settings.hh>
#include <vamp/random/halton.hh>
#include <vamp/utils.hh>
#include <vamp/vector.hh>

namespace vamp::planning
{
    template <typename Robot, typename RNG, std::size_t rake, std::size_t resolution>
    struct RRT
    {
        // robot configuration object - ex. for a pandas it is a length 7 FloatVector
        using Configuration = typename Robot::Configuration;
        // dimension of robot configuration space
        static constexpr auto dimension = Robot::dimension;

        // case where we only have one goal
        inline static auto solve(
            const Configuration &start,
            const Configuration &goal,
            const collision::Environment<FloatVector<rake>> &environment,
            const RRTSettings &settings
        ) -> PlanningResult<dimension>
        {
            return solve(start, std::vector<Configuration>{goal}, environment, settings);
        }

        inline static auto solve(
            const Configuration &start,
            const std::vector<Configuration> &goals,
            const collision::Environment<FloatVector<rake>> &environment,
            const RRTSettings &settings
        ) -> PlanningResult<dimension>
        {
            PlanningResult<dimension> result;
            NN<dimension> tree;
            constexpr const std::size_t start_index = 0;

            /*
             * A chunk of memory to hold all the states in our tree.
             * num_scalars_rounded is the config dimension rounded up
             * to the nearest byte boundary. The reason for this is because
             * the vectors should be aligned to load into SIMD for optimal
             * performance.
             */
            auto buffer = std::unique_ptr<float, decltype(&free)>(
                vamp::utils::vector_alloc<float, FloatVectorAlignment, FloatVectorWidth>(
                    settings.max_samples * Configuration::num_scalars_rounded
                ),
                &free
            );

            // function to index the buffer
            const auto buffer_index = [&buffer](std::size_t index) -> float *
            {
                return buffer.get() + index * Configuration::num_scalars_rounded;
            };

            std::vector<std::size_t> parents(settings.max_samples);
            std::vector<float> radii(settings.max_samples);

            auto start_time = std::chrono::steady_clock::now();

            // check if the start and goal can be connected directly
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

            // random number generation for sampling new states
            RNG rng(settings.rng_skip_iterations);
            std::size_t free_index = start_index + 1;

            // add start to tree
            start.to_array(buffer_index(start_index));
            tree.insert(NNNode<dimension>{start_index, {buffer_index(start_index)}});
            parents[start_index] = start_index;
            
            // // add goals to tree
            // for (const auto &goal : goals)
            // {
            //     goal.to_array(buffer_index(free_index));
            //     goal_tree.insert(NNNode<dimension>{free_index, {buffer_index(free_index)}});
            //     parents[free_index] = free_index;
            //     free_index++;
            // }

            // main RRT loop
            std::size_t iter = 0;
            while (iter++ < settings.max_iterations and free_index < settings.max_samples) {
                // sample a new configuration
                auto sample_config = rng.next();
                Robot::scale_configuration(sample_config);
                typename Robot::ConfigurationBuffer sample_config_arr;
                sample_config.to_array(sample_config_arr.data());

                const auto nearest = tree.nearest(NNFloatArray<dimension>{sample_config_arr.data()});
                if (not nearest)
                {
                    continue;
                }
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
                    float *new_configuration_index = buffer_index(free_index);
                    auto new_configuration = nearest_configuration + extension_vector;
                    new_configuration.to_array(new_configuration_index);
                    tree.insert(NNNode<dimension>{free_index, {new_configuration_index}});
                    parents[free_index] = nearest_node.index;
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
    };
}

