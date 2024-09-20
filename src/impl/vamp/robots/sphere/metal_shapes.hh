#pragma once

struct CollisionKernelArgs {
    unsigned int num_spheres_in_environment;
    float sphere_robot_radius;
};

namespace metal_shapes
{
    struct Sphere
    {
        float x;
        float y;
        float z;
        float r;
        
        Sphere() = default;

        explicit Sphere(float x, float y, float z, float r) : x(x), y(y), z(z), r(r) {}
    };
}  // namespace metal_shapes