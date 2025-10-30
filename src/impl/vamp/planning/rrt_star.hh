#pragma once

#include <memory>

#include <vamp/collision/environment.hh>
#include <vamp/planning/nn.hh>
#include <vamp/planning/plan.hh>
#include <vamp/planning/validate.hh>
#include <vamp/planning/rrt_star_settings.hh>
#include <vamp/random/rng.hh>
#include <vamp/utils.hh>
#include <vamp/vector.hh>

namespace vamp::planning
{
    template <typename Robot, std::size_t rake, std::size_t resolution>
    struct RRTStar
    {
        using Configuration = typename Robot::Configuration;
        static constexpr auto dimension = Robot::dimension;
        static constexpr auto space_measure = Robot::space_measure;
        using RNG = typename vamp::rng::RNG<Robot>;

        inline static auto solve(
            const Configuration &start,
            const Configuration &goal,
            const collision::Environment<FloatVector<rake>> &environment,
            const RRTStarSettings &settings,
            typename RNG::Ptr rng) noexcept -> PlanningResult<Robot>
        {
            return solve(start, std::vector<Configuration>{goal}, environment, settings, rng);
        }

        inline static auto solve(
            const Configuration &start,
            const std::vector<Configuration> &goals,
            const collision::Environment<FloatVector<rake>> &environment,
            const RRTStarSettings &settings,
            typename RNG::Ptr rng) noexcept -> PlanningResult<Robot>
        {

            static constexpr float unit_ball_volume =
                std::pow(std::sqrt(M_PI), dimension) / std::tgamma(dimension / 2.0 + 1.0);
            static constexpr float free_volume = space_measure();
            static constexpr float dim_recip = 1.0 / dimension;
            static constexpr float gamma_rrt =
                std::pow(2 * (1.0 + 1.0 / dimension) * (free_volume / unit_ball_volume), dim_recip) * settings.rewire_factor;
            
            
            PlanningResult<Robot> result;

            NN<dimension> tree;

            constexpr const std::size_t start_index = 0;

            auto buffer = std::unique_ptr<float, decltype(&free)>(
                vamp::utils::vector_alloc<float, FloatVectorAlignment, FloatVectorWidth>(
                    settings.max_samples * Configuration::num_scalars_rounded),
                &free);
            
            const auto buffer_index = [&buffer](std::size_t index) -> float *
            { return buffer.get() + index * Configuration::num_scalars_rounded; };

            std::vector<std::size_t> parent(settings.max_samples);
            std::vector<std::vector<std::size_t>> children(settings.max_samples);
            std::vector<float> radii(settings.max_samples);
            std::vector<float> cost(settings.max_samples);

            const auto add_edge = [&parent, &children](std::size_t parent_node, std::size_t child_node)
            {
                parent[child_node] = parent_node;
                children[parent_node].emplace_back(child_node);
            };

            const auto remove_edge = [&parent, &children](std::size_t parent_node, std::size_t child_node)
            {
                parent[child_node] = -1;
                auto it = std::find(children[parent_node].begin(), children[parent_node].end(), child_node);
                if (it != children[parent_node].end())
                {
                    children[parent_node].erase(it);
                }
            };

            const std::function<void(std::size_t)> update_children =
                [&cost, &children, &buffer_index, &update_children](std::size_t idx)
            {
                Configuration cur(buffer_index(idx));
                for (auto &child : children[idx])
                {
                    auto new_cost = cost[idx] + cur.distance(buffer_index(child));
                    if (new_cost < cost[child])
                    {
                        cost[child] = new_cost;
                        update_children(child);
                    }
                }
            };

            const auto build_path = [&result, &buffer_index, &parent](const Configuration &goal, const std::size_t last_config_idx)
            {
                result.path.emplace_back(goal);
                result.path.emplace_back(buffer_index(last_config_idx));
                auto current = last_config_idx;
                while (parent[current] != current) {
                    auto parent_idx = parent[current];
                    result.path.emplace_back(buffer_index(parent_idx));
                    current = parent_idx;
                }
                result.path.emplace_back(start);
                std::reverse(result.path.begin(), result.path.end());
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
                    result.size.emplace_back(1);

                    return result;
                }
            }

            std::size_t iter = 0;
            std::size_t free_index = start_index + 1;

            // add start to tree
            start.to_array(buffer_index(start_index));
            start_tree.insert(NNNode<dimension>{start_index, {buffer_index(start_index)}});
            parents[start_index] = start_index;
            radii[start_index] = std::numeric_limits<float>::max();
            cost[start_index] = 0.;

            while (iter++ < settings.max_iterations and free_index < settings.max_samples)
            {
                // sample random configuration
                auto temp = rng->next();
                typename Robot::ConfigurationBuffer temp_array;
                temp.to_array(temp_array.data());


                const auto nearest = tree.nearest(NNFloatArray<dimension>{temp_array.data()});
                if (not nearest)
                {
                    continue;
                }

                const auto &[nearest_node, nearest_distance] = *nearest;
                const auto nearest_radius = radii[nearest_node.index];

                if (settings.dynamic_domain and nearest_radius < nearest_distance)
                {
                    continue;
                }

                const auto nearest_configuration = nearest_node.as_vector();

                auto nearest_vector = temp - nearest_configuration;

                bool reach = nearest_distance < settings.range;
                auto extension_vector =
                    (reach) ? nearest_vector : nearest_vector * (settings.range / nearest_distance);

                // steer to nearest configuration
                if (validate_vector<Robot, rake, resolution>(
                        nearest_configuration,
                        extension_vector,
                        (reach) ? nearest_distance : settings.range,
                        environment))
                {
                    float *new_configuration_index = buffer_index(free_index);
                    auto new_configuration = nearest_configuration + extension_vector;
                    new_configuration.to_array(new_configuration_index);

                    // sample points in graph within radius r of new config
                    const std::size_t card = tree.size() + 1;
                    const float nn_radius = std::fmin(
                        gamma_rrt * std::pow((std::log(card) / card), dim_recip),
                        settings.range);
                    tree.nearest(near, NNFloatArray<dimension>{new_configuration_index}, card, nn_radius);
                    
                    // find best parent
                    auto min_neighbor = nearest_node;
                    float min_cost = cost[nearest_node.index] + nearest_distance;

                    std::vector<bool> collision_free(near.size());
                    for (auto i = 0U; i < near.size(); i++)
                    {
                        const auto &[node, distance] = near[i];
                        auto configuration = node.as_vector();
                        collision_free[i] = validate_motion<Robot, rake, resolution>(
                            configuration, new_configuration, environment);
                        const float cur_cost = cost[node.index] + distance;
                        if (collision_free[i] and (cur_cost < min_cost))
                        {
                            min_cost = cur_cost;
                            min_neighbor = node;
                        }
                    }

                    // add an edge from min cost neighbor to new config
                    tree.insert(NNNode<dimension>{free_index, {new_configuration_index}});
                    add_edge(min_neighbor.index, free_index);
                    cost[free_index] = min_cost;

                    // rewire
                    for (auto i = 0U; i < near.size(); i++)
                    {
                        const auto &[node, distance] = near[i];
                        if (collision_free[i] and (min_cost + distance < cost[node.index]))
                        {
                            remove_edge(parent[node.index], node.index);
                            add_edge(free_index, node.index);

                            // propgate saved cost to children
                            cost[node.index] = min_cost + distance;
                            update_children(node.index);
                        }
                    }

                    free_index++;

                    if (settings.dynamic_domain and nearest_radius != std::numeric_limits<float>::max())
                    {
                        radii[nearest_node.index] *= (1 + settings.alpha);
                    }

                    if (settings.force_max_iters) continue;

                    // check if we can reach a goal if not force max iterations
                    bool found_goal = false;
                    for (const auto &goal : goals)
                    {
                        if (validate_motion<Robot, rake, resolution>(new_configuration, goal, environment))
                        {
                            auto current = free_index - 1;
                            result.cost = cost[current] + goal.distance(new_configuration);
                            build_path(goal, current);
                            found_goal = true;
                            break;
                        }
                    }
                    if (found_goal) break;
                }
                else if (settings.dynamic_domain)
                {
                    if (nearest_radius == std::numeric_limits<float>::max())
                    {
                        radii[nearest_node.index] = settings.radius;
                    }
                    else
                    {
                        radii[nearest_node.index] =
                            std::max(radii[nearest_node.index] * (1.F - settings.alpha), settings.min_radius);
                    }
                }
            }
            if (settings.force_max_iters) {
                // find the best path to a goal
                float best_cost = std::numeric_limits<float>::max();
                std::size_t best_index = 0;
                std::size_t best_goal_index = 0;
                for (std::size_t i = 0U; i < tree.size(); i++) {
                    auto configuration = buffer_index(i);
                    for (std::size_t j = 0U; j < goals.size(); j++) {
                        const auto &goal = goals[j];
                        if (validate_motion<Robot, rake, resolution>(configuration, goal, environment)) {
                            float cost = cost[i] + configuration.distance(goal);
                            if (cost < best_cost) {
                                best_cost = cost;
                                best_index = i;
                                best_goal_index = j;
                            }
                        }
                    }
                }
                build_path(goals[best_goal_index], best_index);
                result.cost = best_cost;
            }
            result.nanoseconds = vamp::utils::get_elapsed_nanoseconds(start_time);
            result.iterations = iter;
            result.size.emplace_back(tree.size());
            return result;
        }
    }
}