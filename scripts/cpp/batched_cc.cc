#include <iostream>
#include <random>

#include <vamp/collision/factory.hh>
#include <vamp/planning/validate.hh>
#include <vamp/robots/sphere.hh>

using Environment = vamp::collision::Environment<float>;
using Robot = vamp::robots::sphere;
static constexpr auto num_configs = 10U;
static constexpr auto num_obstacles = 10U;

auto main(int argc, char **) -> int
{    
    std::mt19937 gen(std::time(0));
    std::uniform_int_distribution<> dist(1, 100);
    std::uniform_real_distribution<> dist1(0.0, 1.0);

    std::array<std::array<float, 3>, num_configs> configs;
    for (auto i = 0U; i < num_configs; i++) {
        configs[i][0] = dist(gen);
        configs[i][1] = dist(gen);
        configs[i][2] = dist(gen);
    }

    Environment environment;
    for (auto i = 0U; i < num_obstacles; i++) {
        std::array<float, 3> obstacle = {dist(gen), dist(gen), dist(gen)};
        double radius = dist1(gen);
        environment.spheres.emplace_back(vamp::collision::factory::sphere::array(obstacle, radius));
    }

    auto result = Robot::fkcc_gpu(environment, configs);

    std::cout << result << std::endl;
    return 0;
} 