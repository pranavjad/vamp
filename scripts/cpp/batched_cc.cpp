#include <iostream>
#include <random>

#include <vamp/vector.hh>
#include <vamp/collision/factory.hh>
#include <vamp/planning/validate.hh>
#include <vamp/robots/sphere.hh>
#include <Foundation/Foundation.hpp>
#include <Metal/Metal.hpp>

static constexpr auto num_configs = 2000U;
static constexpr auto num_obstacles = 4U;
static constexpr auto simd_width = 4U;

auto main() -> int
{    
    std::mt19937 gen(std::time(0));
    std::uniform_real_distribution<float> dist(0.0, 1.0);
    std::uniform_real_distribution<> dist1(0.0, 0.05);
    
    // Create the environment
    vamp::collision::Environment<float> gpu_environment;
    vamp::collision::Environment<vamp::FloatVector<simd_width>> cpu_environment;
    for (auto i = 0U; i < num_obstacles; i++) {
        std::array<float, 3> obstacle = {dist(gen), dist(gen), dist(gen)};
        std::cout << "Obstacle: " << obstacle[0] << " " << obstacle[1] << " " << obstacle[2] << std::endl;
        double radius = dist1(gen);
        auto sphere = vamp::collision::factory::sphere::array(obstacle, radius);
        gpu_environment.spheres.emplace_back(sphere);
        cpu_environment.spheres.emplace_back(sphere);
    }

    // Create the configurations
    std::array<std::array<float, 3>, num_configs> configs;
    std::array<std::array<float, num_configs>, 3> configs_transposed;

    for (auto i = 0U; i < num_configs; i++) {
        configs[i][0] = dist(gen);
        configs[i][1] = dist(gen);
        configs[i][2] = dist(gen);
        // std::cout << "Config: " << configs[i][0] << " " << configs[i][1] << " " << configs[i][2] << std::endl;

        configs_transposed[0][i] = configs[i][0];
        configs_transposed[1][i] = configs[i][1];
        configs_transposed[2][i] = configs[i][2];
    }

    // CPU Collision Check
    bool cpu_result = true;
    for (auto i = 0U; i < num_configs/simd_width; i++) {
        vamp::robots::Sphere::ConfigurationBlock<simd_width> block;
        std::vector<float> row0(configs_transposed[0].begin() + i*simd_width, configs_transposed[0].begin() + (i+1)*simd_width);
        std::vector<float> row1(configs_transposed[1].begin() + i*simd_width, configs_transposed[1].begin() + (i+1)*simd_width);
        std::vector<float> row2(configs_transposed[2].begin() + i*simd_width, configs_transposed[2].begin() + (i+1)*simd_width);
        // std::copy(configs_transposed[0].begin() + i*simd_width, configs_transposed[0].begin() + (i+1)*simd_width, row0);
        // std::copy(configs_transposed[1].begin() + i*simd_width, configs_transposed[1].begin() + (i+1)*simd_width, row1);
        // std::copy(configs_transposed[2].begin() + i*simd_width, configs_transposed[2].begin() + (i+1)*simd_width, row2);
        block[0] = vamp::FloatVector<simd_width>(row0);
        block[1] = vamp::FloatVector<simd_width>(row1);
        block[2] = vamp::FloatVector<simd_width>(row2);

        // std::cout << "Block: " << i << " | " << block << std::endl;
        cpu_result = cpu_result && vamp::robots::Sphere::fkcc<simd_width>(cpu_environment, block);
        if (!cpu_result) {
            break;
        }
    }

    auto gpu_result = vamp::robots::Sphere::fkcc_gpu<num_configs>(gpu_environment, configs);
    std::cout << std::endl;
    std::cout << "GPU Result: " << gpu_result << std::endl;
    std::cout << "CPU Result: " << cpu_result << std::endl;
    return 0;
} 