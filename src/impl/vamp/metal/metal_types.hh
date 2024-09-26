#pragma once

struct CollisionKernelArgs {
    unsigned int num_spheres_in_environment;
};

struct SphereCollisionKernelArgs {
    unsigned int num_spheres_in_environment;
    float sphere_robot_radius;
};

namespace metal_types
{
    // struct Shape
    // {
    //     float min_distance;

    //     // Shape() = default;

    //     // explicit Shape(const Shape &other) : min_distance(other.min_distance) {}
    // };

    struct Sphere
    {
        float x;
        float y;
        float z;
        float r;
        float min_distance;

        Sphere() = default;

        constexpr explicit Sphere(float x_, float y_, float z_, float r_) : x(x_), y(y_), z(z_), r(r_) {}
    };

    // struct Environment
    // {
    //     constant Sphere *spheres;
    //     uint num_spheres;
    //     // std::optional<Attachment<DataT>> attachments;

    //     // Environment() = default;

    //     // explicit Environment(const Environment &other)
    //     //   : spheres(other.spheres.begin(), other.spheres.end())
    //     // {
    //     // }
    // };

    inline constexpr auto dot3(
        const float ax,
        const float ay,
        const float az,
        const float bx,
        const float by,
        const float bz) -> float
    {
        return ax * bx + ay * by + az * bz;
    }

    inline constexpr auto sphere_sphere_sql2(
        const float ax,
        const float ay,
        const float az,
        const float ar,
        const float bx,
        const float by,
        const float bz,
        const float br) -> float
    {
        const auto dx = ax - bx;
        const auto dy = ay - by;
        const auto dz = az - bz;
        const auto rsq = ar + br;
        return dot3(dx, dy, dz, dx, dy, dz) - rsq * rsq;
    }

    inline constexpr auto sphere_sphere_sql2(
        const metal_types::Sphere a,
        const float bx,
        const float by,
        const float bz,
        const float br) -> float
    {
        return sphere_sphere_sql2(a.x, a.y, a.z, a.r, bx, by, bz, br);
    }


    inline constexpr auto sphere_sphere_self_collision(
        float ax_,
        float ay_,
        float az_,
        float ar_,
        float bx_,
        float by_,
        float bz_,
        float br_) -> bool
    {
        return sphere_sphere_sql2(ax_, ay_, az_, ar_, bx_, by_, bz_, br_) < 0;
    }
}  // namespace metal_types