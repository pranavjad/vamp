#pragma once

// #define NS_PRIVATE_IMPLEMENTATION
// #define CA_PRIVATE_IMPLEMENTATION
// #define MTL_PRIVATE_IMPLEMENTATION
#include <Foundation/Foundation.hpp>
#include <Metal/Metal.hpp>
#include <QuartzCore/QuartzCore.hpp>

#include <iostream>
#include <vamp/vector.hh>
#include <vamp/collision/environment.hh>
#include <vamp/collision/validity.hh>
#include <vamp/metal/metal_types.hh>

// NOLINTBEGIN(*-magic-numbers)
namespace vamp::robots::sphere
{
    using Configuration = FloatVector<3>;

    template <std::size_t rake>
    using ConfigurationBlock = FloatVector<rake, 3>;

    // Pad and align vectors for easy loading.
    alignas(FloatVectorAlignment) static std::array<float, FloatVectorWidth> lows{-10, -10, 0};
    alignas(FloatVectorAlignment) static std::array<float, FloatVectorWidth> highs{10, 10, 5};
    static float radius = 0.2;

    inline void set_radius(float new_radius) noexcept
    {
        radius = new_radius;
    }

    inline void set_lows(std::array<float, 3> new_lows) noexcept
    {
        std::copy_n(new_lows.cbegin(), 3, lows.begin());
    }

    inline void set_highs(std::array<float, 3> new_highs) noexcept
    {
        std::copy_n(new_highs.cbegin(), 3, highs.begin());
    }

    inline void scale_configuration(Configuration &q) noexcept
    {
        Configuration clow(lows.data());
        Configuration chigh(highs.data());

        q = q * (chigh - clow) + clow;
    }

    inline void descale_configuration(Configuration &q) noexcept
    {
        Configuration clow(lows.data());
        Configuration chigh(highs.data());

        q = (q - clow) / (chigh - clow);
    }

    template <std::size_t rake>
    inline void scale_configuration_block(ConfigurationBlock<rake> &q) noexcept
    {
        q[0] = lows[0] + (q[0] * (highs[0] - lows[0]));
        q[1] = lows[1] + (q[1] * (highs[1] - lows[1]));
        q[2] = lows[2] + (q[2] * (highs[2] - lows[2]));
    }

    template <std::size_t rake>
    inline void descale_configuration_block(ConfigurationBlock<rake> &q) noexcept
    {
        q[0] = (q[0] - lows[0]) / (highs[0] - lows[0]);
        q[1] = (q[1] - lows[1]) / (highs[1] - lows[1]);
        q[2] = (q[2] - lows[2]) / (highs[2] - lows[2]);
    }

    inline static auto space_measure() noexcept -> float
    {
        Configuration clow(lows.data());
        Configuration chigh(highs.data());
        return (chigh - clow).l2_norm();
    }

    constexpr auto n_spheres = 1;

    template <std::size_t rake>
    struct Spheres
    {
        FloatVector<rake, 1> x;
        FloatVector<rake, 1> y;
        FloatVector<rake, 1> z;
        FloatVector<rake, 1> r;
    };

    template <std::size_t rake>
    inline void sphere_fk(const ConfigurationBlock<rake> &q, Spheres<rake> &out) noexcept
    {
        out.x[0] = q[0];
        out.y[0] = q[1];
        out.z[0] = q[2];
        out.r[0] = radius;
    }

    template <std::size_t rake>
    inline bool interleaved_sphere_fk(
        const vamp::collision::Environment<FloatVector<rake>> &environment,
        const ConfigurationBlock<rake> &q) noexcept
    {
        return not sphere_environment_in_collision(environment, q[0], q[1], q[2], radius);
    }

    inline void start_capture(std::string path, MTL::Device* device) {
        auto descriptor = MTL::CaptureDescriptor::alloc()->init();
        descriptor->setCaptureObject(device);

        if (!path.empty()) {
            auto string = NS::String::string(path.c_str(), NS::UTF8StringEncoding);
            auto url = NS::URL::fileURLWithPath(string);
            descriptor->setDestination(MTL::CaptureDestinationGPUTraceDocument);
            descriptor->setOutputURL(url);
        }

        auto manager = MTL::CaptureManager::sharedCaptureManager();
        NS::Error* error;
        bool started = manager->startCapture(descriptor, &error);
        descriptor->release();
        if (!started) {
            std::ostringstream msg;
            msg << "[metal::start_capture] Failed to start: "
                << error->localizedDescription()->utf8String();
            throw std::runtime_error(msg.str());
        }
    }

    inline void stop_capture() {
        auto manager = MTL::CaptureManager::sharedCaptureManager();
        manager->stopCapture();
    }

    template <std::size_t rake>
    inline bool interleaved_sphere_fk_metal(
        const vamp::collision::Environment<float> &environment,
        const std::array<std::array<float, 3>, rake> &q) noexcept
    {
        // return true;
        auto num_cfgs = q.size();
        std::cout << "num_cfgs: " << num_cfgs << std::endl;
        std::cout << "num spheres: " << environment.spheres.size() << std::endl;
        // set up buffers
        MTL::Device* device = MTL::CreateSystemDefaultDevice();
        assert(device != nullptr);
        std::cout << "Device created successfully" << std::endl;
        std::cout << "Device max buffer length: " << device->maxBufferLength() << " bytes" << std::endl;
        auto storage_mode = MTL::ResourceStorageModeShared;
        std::cout << "storage mode: " << storage_mode << std::endl;
        // MTL::Buffer *env_buf = device->newBuffer(sizeof(vamp::collision::Environment<float>), storage_mode);
        auto spheres_size = sizeof(metal_types::Sphere) * environment.spheres.size();
        std::cout << "spheres_size: " << spheres_size << std::endl;
        MTL::Buffer *spheres_buf = device->newBuffer(spheres_size, storage_mode);
        assert(spheres_buf != nullptr);
        // std::cout << "sizeof env: " << sizeof(vamp::collision::Environment<float>) << std::endl;
        std::cout << "spheres_buf: " << spheres_buf->contents() << std::endl;
        MTL::Buffer *cfg_buf = device->newBuffer(sizeof(float) * 3 * num_cfgs, storage_mode);
        assert(cfg_buf != nullptr);
        std::cout << "cfg_buf: " << cfg_buf->contents() << std::endl;
        MTL::Buffer *out_buf = device->newBuffer(sizeof(bool) * num_cfgs, storage_mode);
        std::cout << "out_buf: " << out_buf->contents() << std::endl;
        MTL::Buffer *args_buf = device->newBuffer(sizeof(SphereCollisionKernelArgs), storage_mode);
        std::cout << "args_buf: " << args_buf->contents() << std::endl;

        // initialize buffers
        // auto env_ptr = static_cast<vamp::collision::Environment<float>*>(env_buf->contents());
        auto spheres_ptr = static_cast<metal_types::Sphere*>(spheres_buf->contents());
        auto cfg_ptr = static_cast<float*>(cfg_buf->contents());
        auto out_ptr = static_cast<bool*>(out_buf->contents());
        auto args_ptr = static_cast<SphereCollisionKernelArgs*>(args_buf->contents());
        // std::cout << "environment argument size: " << sizeof(environment) << std::endl;
        // std::cout << "env_ptr: " << env_ptr << std::endl;
        // // *env_ptr = environment;
        // std::cout << "env_ptr: " << env_ptr << std::endl;
        std::cout << "copying spheres" << std::endl;
        for (auto i = 0U; i < environment.spheres.size(); i++) {
            spheres_ptr[i].x = environment.spheres[i].x;
            spheres_ptr[i].y = environment.spheres[i].y;
            spheres_ptr[i].z = environment.spheres[i].z;
            spheres_ptr[i].r = environment.spheres[i].r;
        }
        std::cout << "done copying spheres" << std::endl;
        for (auto i = 0U; i < num_cfgs; i++) {
            // cfg_ptr[i] = 1.0;
            cfg_ptr[i * 3] = q[i][0];
            cfg_ptr[i * 3 + 1] = q[i][1];
            cfg_ptr[i * 3 + 2] = q[i][2];
            // std::cout << "Config: " << cfg_ptr[i * 3] << " " << cfg_ptr[i * 3 + 1] << " " << cfg_ptr[i * 3 + 2] << std::endl;
        }
        for (auto i = 0U; i < num_cfgs; i++) {
            out_ptr[i] = false;
        }
        args_ptr->num_spheres_in_environment = environment.spheres.size();
        args_ptr->sphere_robot_radius = radius;
        

        // initialize pipeline
        // start_capture("/Users/pranavj/Documents/coding/zaklab/vamp/src/impl/vamp/robots/sphere/capture.gputrace", device);
        std::string shader_name = "sphere_collision_check";
        std::string library_path = "/Users/pranavj/Documents/coding/zaklab/vamp/build/CollisionChecking.metallib";
        auto library_path_str = NS::String::string(library_path.c_str(), NS::ASCIIStringEncoding);
        NS::Error *lib_error;
        MTL::Library *default_library = device->newLibrary(library_path_str, &lib_error);
        assert(default_library != nullptr);
        auto shader_name_str = NS::String::string(shader_name.c_str(), NS::ASCIIStringEncoding);
        MTL::Function *sphere_cc_fn = default_library->newFunction(shader_name_str);
        std::cout << "sphere_cc_fn: " << sphere_cc_fn << std::endl;
        assert(sphere_cc_fn);
        NS::Error *pso_error;
        MTL::ComputePipelineState* sphere_cc_pso = device->newComputePipelineState(sphere_cc_fn, &pso_error);
        std::cout << "sphere_cc_pso: " << sphere_cc_pso << std::endl;
        // initialize command queue, command buffer, and compute encoder
        MTL::CommandQueue *command_queue = device->newCommandQueue();

        // capture gpu trace
        // MTL::CaptureManager* pCaptureManager = MTL::CaptureManager::sharedCaptureManager();
        // auto success = pCaptureManager->supportsDestination(MTL::CaptureDestinationGPUTraceDocument);
        // assert(success);
        // MTL::CaptureDescriptor* pCaptureDescriptor = MTL::CaptureDescriptor::alloc()->init();
        // pCaptureDescriptor->setDestination(MTL::CaptureDestinationGPUTraceDocument);
        // std::string trace_path = "/Users/pranavj/Documents/coding/zaklab/vamp/src/impl/vamp/robots/sphere/capture.gputrace";
        // pCaptureDescriptor->setOutputURL(NS::URL::fileURLWithPath(NS::String::string(trace_path.c_str(), NS::ASCIIStringEncoding)));
        // pCaptureDescriptor->setCaptureObject(device);
        // NS::Error *cap_error;
        // success = pCaptureManager->startCapture(pCaptureDescriptor, &cap_error);
        // assert(success);

        MTL::CommandBuffer *command_buffer = command_queue->commandBuffer();
        assert(command_buffer != nullptr);
        MTL::ComputeCommandEncoder *compute_encoder = command_buffer->computeCommandEncoder();
        assert(compute_encoder != nullptr);

        compute_encoder->setComputePipelineState(sphere_cc_pso);
        compute_encoder->setBuffer(spheres_buf, 0, 0);
        compute_encoder->setBuffer(cfg_buf, 0, 1);
        compute_encoder->setBuffer(args_buf, 0, 2);
        compute_encoder->setBuffer(out_buf, 0, 3);

        // initialize grid
        MTL::Size grid_size = MTL::Size::Make(num_cfgs, 1, 1);
        NS::UInteger thread_group_sz = sphere_cc_pso->maxTotalThreadsPerThreadgroup();
        std::cout << "max threads per threadgroup: " << thread_group_sz << std::endl;
        if (thread_group_sz > num_cfgs) {
            thread_group_sz = num_cfgs;
        }
        MTL::Size thread_group_size = MTL::Size::Make(thread_group_sz, 1, 1);

        // dispatch threads
        compute_encoder->dispatchThreadgroups(grid_size, thread_group_size);
        compute_encoder->endEncoding();

        
        // commit and wait
        command_buffer->commit();
        command_buffer->waitUntilCompleted();

        // stop_capture();

        for (auto i = 0U; i < num_cfgs; i++) {
            if (out_ptr[i]) {
                return false;
            }
        }

        // static_cast<vamp::collision::Environment<float>*>(env_buf->contents())->~Environment();
        // env_buf->release();
        spheres_buf->release();
        cfg_buf->release();
        out_buf->release();
        args_buf->release();
        device->release();
        return true;
    }

    inline auto eefk(const std::array<float, 3> &q) noexcept -> std::array<float, 7>
    {
    }
}  // namespace vamp::robots::sphere

// NOLINTEND(*-magic-numbers)
