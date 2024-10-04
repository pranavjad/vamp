#include <iostream>
#include <iomanip>
#include <random>
#include <chrono>
#include <unistd.h>

#define NS_PRIVATE_IMPLEMENTATION
#define CA_PRIVATE_IMPLEMENTATION
#define MTL_PRIVATE_IMPLEMENTATION
#define MTK_PRIVATE_IMPLEMENTATION

#include <vamp/vector.hh>
#include <vamp/collision/factory.hh>
#include <vamp/planning/validate.hh>
#include <vamp/robots/sphere.hh>
#include <vamp/robots/panda.hh>
#include <vamp/random/halton.hh>
#include <vamp/utils.hh>

#include <Foundation/Foundation.hpp>
#include <Metal/Metal.hpp>

#include <iostream>

static auto num_configs = 10000000;
static constexpr auto num_obstacles = 100000U;
static constexpr auto simd_width = 4U;

// inline auto sphere_test()
// {

//     std::mt19937 gen(0);
//     std::uniform_real_distribution<float> center_dist(0.0, 1.0);
//     std::uniform_real_distribution<> radius_dist(0.0, 0.05);    
    
//     // Create the environment
//     vamp::collision::Environment<float> gpu_environment;
//     vamp::collision::Environment<vamp::FloatVector<simd_width>> cpu_environment;
//     for (auto i = 0U; i < num_obstacles; i++) {
//         std::array<float, 3> obstacle = {center_dist(gen), center_dist(gen), center_dist(gen)};
//         std::cout << "Obstacle: " << obstacle[0] << " " << obstacle[1] << " " << obstacle[2] << std::endl;
//         // double radius = radius_dist(gen);
//         auto sphere = vamp::collision::Sphere<float>(center_dist(gen), center_dist(gen), center_dist(gen), radius_dist(gen));
//         gpu_environment.spheres.emplace_back(sphere);
//         cpu_environment.spheres.emplace_back(sphere);
//     }

//     // Create the configurations
//     std::array<std::array<float, 3>, num_configs> configs;
//     std::array<std::array<float, num_configs>, 3> configs_transposed;

//     for (auto i = 0U; i < num_configs; i++) {
//         configs[i][0] = center_dist(gen);
//         configs[i][1] = center_dist(gen);
//         configs[i][2] = center_dist(gen);
//         // std::cout << "Config: " << configs[i][0] << " " << configs[i][1] << " " << configs[i][2] << std::endl;

//         configs_transposed[0][i] = configs[i][0];
//         configs_transposed[1][i] = configs[i][1];
//         configs_transposed[2][i] = configs[i][2];
//     }

//     // CPU Collision Check
//     bool cpu_result = true;
//     for (auto i = 0U; i < num_configs/simd_width; i++) {
//         vamp::robots::Sphere::ConfigurationBlock<simd_width> block;
//         std::vector<float> row0(configs_transposed[0].begin() + i*simd_width, configs_transposed[0].begin() + (i+1)*simd_width);
//         std::vector<float> row1(configs_transposed[1].begin() + i*simd_width, configs_transposed[1].begin() + (i+1)*simd_width);
//         std::vector<float> row2(configs_transposed[2].begin() + i*simd_width, configs_transposed[2].begin() + (i+1)*simd_width);
//         block[0] = vamp::FloatVector<simd_width>(row0);
//         block[1] = vamp::FloatVector<simd_width>(row1);
//         block[2] = vamp::FloatVector<simd_width>(row2);
//         // std::cout << "Block: " << i << " | " << block << std::endl;
//         cpu_result = cpu_result && vamp::robots::Sphere::fkcc<simd_width>(cpu_environment, block);
//         if (!cpu_result) {
//             break;
//         }
//     }

//     auto start_time = std::chrono::steady_clock::now();
//     auto gpu_result = vamp::robots::Sphere::fkcc_gpu<num_configs>(gpu_environment, configs);
//     std::cout << "GPU time: " << vamp::utils::get_elapsed_nanoseconds(start_time) << " ns" << std::endl;

//     std::cout << std::endl;
//     std::cout << "GPU Result: " << gpu_result << std::endl;
//     std::cout << "CPU Result: " << cpu_result << std::endl;
// }

inline bool panda_test(int seed = 0)
{
    using panda = vamp::robots::Panda;
    auto constexpr dim = panda::dimension;
    auto rng = vamp::rng::Halton<dim>();
    auto HALTON_MAX = 1400000;
    // std::cout << "seed: " << seed << std::endl;
    std::mt19937 gen(seed);
    std::uniform_real_distribution<float> center_dist(0, 1.0);
    std::uniform_real_distribution<> radius_dist(0.0, 0.5);
    
    // Create the environment
    vamp::collision::Environment<float> gpu_environment;
    for (auto i = 0U; i < num_obstacles; i++) {
        auto sphere = vamp::collision::Sphere<float>(center_dist(gen), center_dist(gen), center_dist(gen), radius_dist(gen));
        gpu_environment.spheres.emplace_back(sphere);
    }
    gpu_environment.sort();
    vamp::collision::Environment<vamp::FloatVector<simd_width>> cpu_environment(gpu_environment);
    // std::cout << "Environment created" << std::endl;

    // Create the configurations
    long configs_size = num_configs; //std::min(num_configs, HALTON_MAX);
    std::vector<std::vector<float>> configs(configs_size, std::vector<float>(dim, 0.0));
    std::vector<std::vector<float>> configs_transposed(dim, std::vector<float>(configs_size, 0.0));
    // std::cout << "Memory size of configs: " << configs_size * dim * sizeof(float) << " bytes" << std::endl;
    for (auto i = 0U; i < configs_size; i++) {
        if (i % HALTON_MAX == 0) {
            rng = vamp::rng::Halton<dim>();
        }
        // if (i%100000 == 0) std::cout << "Config: " << i << std::endl;
        auto config = rng.next();
        panda::scale_configuration(config);
        auto config_array = config.to_array();

        for (auto j = 0U; j < dim; j++) {
            configs[i][j] = config_array[j];
            configs_transposed[j][i] = config_array[j];
        }
    }
    // std::cout << "Configs generated" << std::endl;

    // CPU Collision Check
    auto start_time_cpu = std::chrono::steady_clock::now();
    panda::ConfigurationBlock<simd_width> block;
    bool cpu_result = true;
    // std::vector<bool> cpu_result_vec(num_configs, false);
    for (auto i = 0U; i < num_configs; i+=simd_width) {
        // int j = i % HALTON_MAX;
        for (auto k = 0U; k < dim; k++) {
            auto row = std::vector<float>(configs_transposed[k].begin() + i, configs_transposed[k].begin() + i + simd_width);
            block[k] = vamp::FloatVector<simd_width>(row);
        }
        cpu_result = panda::fkcc<simd_width>(cpu_environment, block);
        if(!cpu_result) {
            break;
        }
    }
    auto cpu_time = vamp::utils::get_elapsed_nanoseconds(start_time_cpu);
    // std::cout << "CPU time: " << std::right << std::setw(8) << cpu_time << " ns" << std::endl;
    std::cout << cpu_time << ",";

    auto start_time_gpu = std::chrono::steady_clock::now();
    auto gpu_result = panda::fkcc_gpu(gpu_environment, configs);
    auto gpu_time = vamp::utils::get_elapsed_nanoseconds(start_time_gpu);
    // std::cout << "GPU time: " << std::right << std::setw(8) << gpu_time << " ns" << std::endl;
    std::cout << gpu_time << ",";
    return cpu_result == gpu_result;
}


auto main() -> int
{
    for (int configs = 1000000; configs <= 10000000; configs += 1000000) {
        num_configs = configs;
        // std::cout << "Testing Configs = " << num_configs << std::endl;
        for (int i = 0; i < 3; i++) {
            // std::cout << "Seed: " << i << std::endl;
            auto result = panda_test(i);
            // std::cout << "Result: " << result << std::endl;
            std::cout << result << std::endl;
        }
        // std::cout << "--------------------------------" << std::endl;
    }
    panda_test();
    return 0;
} 