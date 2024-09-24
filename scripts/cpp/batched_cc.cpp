#include <iostream>
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

static constexpr auto num_configs = 16U;
static constexpr auto num_obstacles = 4U;
static constexpr auto simd_width = 4U;

inline auto sphere_test()
{

    std::mt19937 gen(0);
    std::uniform_real_distribution<float> center_dist(0.0, 1.0);
    std::uniform_real_distribution<> radius_dist(0.0, 0.05);    
    
    // Create the environment
    vamp::collision::Environment<float> gpu_environment;
    vamp::collision::Environment<vamp::FloatVector<simd_width>> cpu_environment;
    for (auto i = 0U; i < num_obstacles; i++) {
        std::array<float, 3> obstacle = {center_dist(gen), center_dist(gen), center_dist(gen)};
        std::cout << "Obstacle: " << obstacle[0] << " " << obstacle[1] << " " << obstacle[2] << std::endl;
        // double radius = radius_dist(gen);
        auto sphere = vamp::collision::Sphere<float>(center_dist(gen), center_dist(gen), center_dist(gen), radius_dist(gen));
        gpu_environment.spheres.emplace_back(sphere);
        cpu_environment.spheres.emplace_back(sphere);
    }

    // Create the configurations
    std::array<std::array<float, 3>, num_configs> configs;
    std::array<std::array<float, num_configs>, 3> configs_transposed;

    for (auto i = 0U; i < num_configs; i++) {
        configs[i][0] = center_dist(gen);
        configs[i][1] = center_dist(gen);
        configs[i][2] = center_dist(gen);
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
        block[0] = vamp::FloatVector<simd_width>(row0);
        block[1] = vamp::FloatVector<simd_width>(row1);
        block[2] = vamp::FloatVector<simd_width>(row2);
        // std::cout << "Block: " << i << " | " << block << std::endl;
        cpu_result = cpu_result && vamp::robots::Sphere::fkcc<simd_width>(cpu_environment, block);
        if (!cpu_result) {
            break;
        }
    }

    auto start_time = std::chrono::steady_clock::now();
    auto gpu_result = vamp::robots::Sphere::fkcc_gpu<num_configs>(gpu_environment, configs);
    std::cout << "GPU time: " << vamp::utils::get_elapsed_nanoseconds(start_time) << " ns" << std::endl;

    std::cout << std::endl;
    std::cout << "GPU Result: " << gpu_result << std::endl;
    std::cout << "CPU Result: " << cpu_result << std::endl;
}

inline bool panda_test()
{
    using panda = vamp::robots::Panda;
    auto constexpr dim = panda::dimension;
    auto rng = vamp::rng::Halton<dim>();
    // auto seed = std::time(nullptr);
    // std::cout << "seed: " << seed << std::endl;
    // 1727186255
    std::mt19937 gen(1727186254);
    std::uniform_real_distribution<float> center_dist(0.0, 1.0);
    std::uniform_real_distribution<> radius_dist(0.0, 0.05);

    // Create the environment
    vamp::collision::Environment<float> gpu_environment;
    // vamp::collision::Environment<vamp::FloatVector<simd_width>> cpu_environment;
    for (auto i = 0U; i < num_obstacles; i++) {
        auto sphere = vamp::collision::Sphere<float>(center_dist(gen), center_dist(gen), center_dist(gen), radius_dist(gen));
        gpu_environment.spheres.emplace_back(sphere);
        // cpu_environment.spheres.emplace_back(sphere);
    }
    // cpu_environment.sort();
    gpu_environment.sort();
    vamp::collision::Environment<vamp::FloatVector<simd_width>> cpu_environment(gpu_environment);

    // Create the configurations
    std::array<std::array<float, dim>, num_configs> configs;
    std::array<std::array<float, num_configs>, dim> configs_transposed;
    // std::vector<std::vector<float>> configs_transposed(dim, std::vector<float>(num_configs));
    for (auto i = 0U; i < num_configs; i++) {
        auto config = rng.next();
        panda::scale_configuration(config);
        auto config_array = config.to_array();

        // print config
        // std::cout << "Config: ";
        // for (auto j = 0U; j < dim; j++) {
        //     std::cout << config_array[j] << " ";
        // }
        // std::cout << std::endl;

        for (auto j = 0U; j < dim; j++) {
            configs[i][j] = config_array[j];
            configs_transposed[j][i] = config_array[j];
        }
    }

    // CPU Collision Check
    auto start_time_cpu = std::chrono::steady_clock::now();
    panda::ConfigurationBlock<simd_width> block;
    bool cpu_result = true;
    std::vector<bool> cpu_result_vec(num_configs, false);
    for (auto i = 0U; i < num_configs; i+=simd_width) {
        for (auto k = 0U; k < dim; k++) {
            auto row = std::vector<float>(configs_transposed[k].begin() + i, configs_transposed[k].begin() + i + simd_width);
            block[k] = vamp::FloatVector<simd_width>(row);
        }
        // fkcc: returns false if there is a collision
        auto fkcc_result = panda::fkcc<simd_width>(cpu_environment, block);
        std::cout << fkcc_result << std::endl;
        cpu_result = cpu_result && fkcc_result;
        cpu_result_vec[i] = fkcc_result;
        if(!cpu_result) {
            break;
        }
    }
    std::cout << "CPU time: " << vamp::utils::get_elapsed_nanoseconds(start_time_cpu) << " ns" << std::endl;

    auto start_time_gpu = std::chrono::steady_clock::now();
    auto gpu_result = panda::fkcc_gpu<num_configs>(gpu_environment, configs);
    std::cout << "GPU time: " << vamp::utils::get_elapsed_nanoseconds(start_time_gpu) << " ns" << std::endl;

    std::cout << std::endl;
    // std::cout << "GPU Result: " << gpu_result << std::endl;
    for (auto i = 0U; i < num_configs; i++) {
        std::cout << gpu_result[i] << " ";
    }
    std::cout << std::endl;
    std::cout << "CPU Result: " << cpu_result << std::endl;
    for (auto i = 0U; i < num_configs; i++) {
        std::cout << cpu_result_vec[i] << " ";
    }
    std::cout << std::endl;
    return 1;
}


auto main() -> int
{    
    panda_test();
    // for (auto i = 0; i < 100; i++) {
    //     std::cout << "--------------------------------" << std::endl;
    //     if (!panda_test()) {
    //         std::cout << "Test failed" << std::endl;
    //         break;
    //     }
    //     sleep(10/1000);
    // }
    // sphere_test();
    return 0;
} 