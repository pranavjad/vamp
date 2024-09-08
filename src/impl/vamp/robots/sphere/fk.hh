#pragma once

#define NS_PRIVATE_IMPLEMENTATION
#define CA_PRIVATE_IMPLEMENTATION
#define MTL_PRIVATE_IMPLEMENTATION
#include <Foundation/Foundation.hpp>
#include <Metal/Metal.hpp>
#include <QuartzCore/QuartzCore.hpp>

#include <vamp/vector.hh>
#include <vamp/collision/environment.hh>
#include <vamp/collision/validity.hh>

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

    template <std::size_t rake>
    inline bool interleaved_sphere_fk_metal(
        const vamp::collision::Environment<float> &environment,
        const std::array<std::array<float, 3>, rake> &q) noexcept
    {
        auto num_cfgs = q.size();
        // set up buffers
        auto device = MTL::CreateSystemDefaultDevice();
        auto storage_mode = MTL::ResourceStorageModeShared;
        MTL::Buffer *env_buf = device->newBuffer(sizeof(vamp::collision::Environment<float>), storage_mode);
        MTL::Buffer *cfg_buf = device->newBuffer(sizeof(float) * 3 * num_cfgs, storage_mode);
        MTL::Buffer *out_buf = device->newBuffer(sizeof(bool) * num_cfgs, storage_mode);
        MTL::Buffer *rad_buf = device->newBuffer(sizeof(float), storage_mode);

        // initialize buffers
        auto env_ptr = static_cast<vamp::collision::Environment<float>*>(env_buf->contents());
        auto cfg_ptr = static_cast<float*>(cfg_buf->contents());
        auto out_ptr = static_cast<bool*>(out_buf->contents());
        auto rad_ptr = static_cast<float*>(rad_buf->contents());
        *env_ptr = environment;
        for (auto i = 0U; i < num_cfgs; i) {
            cfg_buf[i * 3] = q[i][0];
            cfg_buf[i * 3 + 1] = q[i][1];
            cfg_buf[i * 3 + 2] = q[i][2];
        }
        *rad_ptr = radius;
        

        // initialize pipeline
        std::string shader_name = "sphere_collision_check";
        MTL::Library *default_library = device->newDefaultLibrary();
        assert(default_library != nullptr);
        auto str = NS::String::string(shader_name.c_str(), NS::ASCIIStringEncoding);
        MTL::Function *sphere_cc_fn = default_library->newFunction(str);
        assert(sphere_cc_fn);
        NS::Error *error;
        MTL::ComputePipelineState* sphere_cc_pso = device->newComputePipelineState(sphere_cc_fn, &error);

        // initialize command queue, command buffer, and compute encoder
        MTL::CommandQueue *command_queue = device->newCommandQueue();
        MTL::CommandBuffer *command_buffer = command_queue->commandBuffer();
        assert(command_buffer != nullptr);
        MTL::ComputeCommandEncoder *compute_encoder = command_buffer->computeCommandEncoder();
        assert(compute_encoder != nullptr);

        compute_encoder->setComputePipelineState(sphere_cc_pso);
        compute_encoder->setBuffer(env_buf, 0, 0);
        compute_encoder->setBuffer(cfg_buf, 0, 1);
        compute_encoder->setBuffer(rad_buf, 0, 2);
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
        command_buffer->commit();
        command_buffer->waitUntilCompleted();

        for (auto i = 0U; i < num_cfgs; i++) {
            if (out_ptr[i]) {
                return false;
            }
        }
        return true;
    }

    inline auto eefk(const std::array<float, 3> &q) noexcept -> std::array<float, 7>
    {
    }
}  // namespace vamp::robots::sphere

// NOLINTEND(*-magic-numbers)
