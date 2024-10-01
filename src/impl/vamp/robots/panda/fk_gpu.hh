#pragma once

#include <Foundation/Foundation.hpp>
#include <Metal/Metal.hpp>
#include <QuartzCore/QuartzCore.hpp>

#include <vamp/vector.hh>
#include <vamp/collision/environment.hh>
#include <vamp/collision/validity.hh>
#include <vamp/metal/metal_types.hh>
#include <vamp/utils.hh>
#include <iostream>
#include <iomanip>

// NOLINTBEGIN(*-magic-numbers)
namespace vamp::robots::panda
{
    template <std::size_t rake>
    inline auto interleaved_sphere_fk_gpu(
        const vamp::collision::Environment<float> &environment,
        const std::vector<std::vector<float>> &q) noexcept -> bool
    {
        auto start_time = std::chrono::steady_clock::now();
        auto num_cfgs = q.size();

        MTL::Device* device = MTL::CreateSystemDefaultDevice();
        assert(device != nullptr);
        auto storage_mode = MTL::ResourceStorageModeShared;
        auto spheres_size = sizeof(metal_types::Sphere) * environment.spheres.size();
        MTL::Buffer *spheres_buf = device->newBuffer(spheres_size, storage_mode);
        assert(spheres_buf != nullptr);
        MTL::Buffer *cfg_buf = device->newBuffer(sizeof(float) * 7 * num_cfgs, storage_mode);
        assert(cfg_buf != nullptr);
        MTL::Buffer *out_buf = device->newBuffer(sizeof(bool) * num_cfgs, storage_mode);
        MTL::Buffer *args_buf = device->newBuffer(sizeof(CollisionKernelArgs), storage_mode);

        auto spheres_ptr = static_cast<metal_types::Sphere*>(spheres_buf->contents());
        auto cfg_ptr = static_cast<float*>(cfg_buf->contents());
        auto out_ptr = static_cast<bool*>(out_buf->contents());
        auto args_ptr = static_cast<CollisionKernelArgs*>(args_buf->contents());
        
        std::string shader_name = "panda_cc";
        std::string library_path = "/Users/pranavj/Documents/coding/zaklab/vamp/build/CollisionChecking.metallib";
        auto library_path_str = NS::String::string(library_path.c_str(), NS::ASCIIStringEncoding);
        NS::Error *lib_error;
        MTL::Library *default_library = device->newLibrary(library_path_str, &lib_error);
        assert(default_library != nullptr);
        auto shader_name_str = NS::String::string(shader_name.c_str(), NS::ASCIIStringEncoding);
        MTL::Function *panda_cc_fn = default_library->newFunction(shader_name_str);
        assert(panda_cc_fn != nullptr);
        NS::Error *pso_error;
        MTL::ComputePipelineState* panda_cc_pso = device->newComputePipelineState(panda_cc_fn, &pso_error);
        assert(panda_cc_pso != nullptr);

        MTL::CommandQueue *command_queue = device->newCommandQueue();
        MTL::CommandBuffer *command_buffer = command_queue->commandBuffer();
        assert(command_buffer != nullptr);
        MTL::ComputeCommandEncoder *command_encoder = command_buffer->computeCommandEncoder();
        assert(command_encoder != nullptr);
        command_encoder->setComputePipelineState(panda_cc_pso);
        command_encoder->setBuffer(spheres_buf, 0, 0);
        command_encoder->setBuffer(cfg_buf, 0, 1);
        command_encoder->setBuffer(args_buf, 0, 2);
        command_encoder->setBuffer(out_buf, 0, 3);

        // initialize grid
        MTL::Size grid_size = MTL::Size::Make(num_cfgs, 1, 1);
        NS::UInteger thread_group_sz = panda_cc_pso->maxTotalThreadsPerThreadgroup();
        // std::cout << "max threads per threadgroup: " << thread_group_sz << std::endl;
        if (thread_group_sz > num_cfgs) {
            thread_group_sz = num_cfgs;
        }
        MTL::Size thread_group_size = MTL::Size::Make(thread_group_sz, 1, 1);

        std::cout << "Kernel setup time: " << std::right << std::setw(8) << vamp::utils::get_elapsed_nanoseconds(start_time) << " ns" << std::endl;
        
        start_time = std::chrono::steady_clock::now();
        // copy data into GPU buffers
        for (auto i = 0U; i < environment.spheres.size(); i++) {
            // new (&spheres_ptr[i]) metal_types::Sphere(environment.spheres[i].x, environment.spheres[i].y, environment.spheres[i].z, environment.spheres[i].r);
            metal_types::Sphere sphere(environment.spheres[i].x, environment.spheres[i].y, environment.spheres[i].z, environment.spheres[i].r);
            sphere.min_distance = std::sqrt(metal_types::dot3(sphere.x, sphere.y, sphere.z, sphere.x, sphere.y, sphere.z)) - sphere.r;
            spheres_ptr[i].x = sphere.x;
            spheres_ptr[i].y = sphere.y;
            spheres_ptr[i].z = sphere.z;
            spheres_ptr[i].r = sphere.r;
            spheres_ptr[i].min_distance = sphere.min_distance;
            // std::cout  << "min_distance: " << spheres_ptr[i].min_distance << std::endl;
        }
        for (auto i = 0U; i < num_cfgs; i++) {
            cfg_ptr[i * 7] = q[i][0];
            cfg_ptr[i * 7 + 1] = q[i][1];
            cfg_ptr[i * 7 + 2] = q[i][2];
            cfg_ptr[i * 7 + 3] = q[i][3];
            cfg_ptr[i * 7 + 4] = q[i][4];
            cfg_ptr[i * 7 + 5] = q[i][5];
            cfg_ptr[i * 7 + 6] = q[i][6];
        }
        for (auto i = 0U; i < num_cfgs; i++) {
            out_ptr[i] = false;
        }
        args_ptr->num_spheres_in_environment = environment.spheres.size();

        command_encoder->dispatchThreads(grid_size, thread_group_size);
        command_encoder->endEncoding();
        command_buffer->commit();
        command_buffer->waitUntilCompleted();
        std::cout << "Kernel exec time: " << std::right << std::setw(8) << vamp::utils::get_elapsed_nanoseconds(start_time) << " ns" << std::endl;

        // std::vector<bool> result(num_cfgs);
        // for (auto i = 0U; i < num_cfgs; i++) {
        //     result[i] = out_ptr[i];
        // }

        for (auto i = 0U; i < num_cfgs; i++) {
            if (!out_ptr[i]) {
                return false;
            }
        }

        spheres_buf->release();
        cfg_buf->release();
        out_buf->release();
        args_buf->release();
        device->release();
        return true;
        // return result;
    }
}  // namespace vamp::robots::panda