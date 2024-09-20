#pragma once

struct CollisionKernelArgs {
    unsigned int num_spheres_in_environment;
    float sphere_robot_radius;
};

namespace metal_types
{
    struct Shape
    {
        float min_distance;

        Shape() = default;

        explicit Shape(const Shape &other) : min_distance(other.min_distance) {}
    };

    struct Sphere : public Shape
    {
        float x;
        float y;
        float z;
        float r;

        Sphere() = default;

        explicit Sphere(float x, float y, float z, float r) : Shape(), x(x), y(y), z(z), r(r)
        {
            min_distance = sqrt(x * x + y * y + z * z) - r;
        }

        explicit Sphere(const Sphere &other)
          : Shape(other)
          , x(other.x)
          , y(other.y)
          , z(other.z)
          , r(other.r)
        {
        }
    };

    struct Environment
    {
        Sphere *spheres;
        uint num_spheres;
        std::optional<Attachment<DataT>> attachments;

        Environment() = default;

        explicit Environment(const Environment &other)
          : spheres(other.spheres.begin(), other.spheres.end())
        {
        }
    };

    inline constexpr auto dot3(
        const float &ax,
        const float &ay,
        const float &az,
        const float &bx,
        const float &by,
        const float &bz) noexcept -> float
    {
        return ax * bx + ay * by + az * bz;
    }

    inline constexpr auto sphere_sphere_sql2(
        const float &ax,
        const float &ay,
        const float &az,
        const float &ar,
        const float &bx,
        const float &by,
        const float &bz,
        const float &br) noexcept -> float
    {
        const auto dx = ax - bx;
        const auto dy = ay - by;
        const auto dz = az - bz;
        const auto rsq = ar + br;
        return dot3(dx, dy, dz, dx, dy, dz) - rsq * rsq;
    }

    inline constexpr auto sphere_sphere_sql2(
        const Sphere &a,
        const float &bx,
        const float &by,
        const float &bz,
        const float &br) noexcept -> float
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
        float br_) noexcept -> bool
    {
        return not (sphere_sphere_sql2(ax, ay, az, ar, bx, by, bz, br) == 0);
    }

    inline constexpr auto sphere_environment_in_collision(
        const Environment *e,
        float sx_,
        float sy_,
        float sz_,
        float sr_) noexcept -> bool
    {
        const float max_extent = sqrt(dot3(sx_, sy_, sz_, sx_, sy_, sz_)) + sr;
        for (uint i = 0; i < e->num_spheres; i++)
        {
            const Sphere &es = e->spheres[i];
            const float diff = es.min_distance - max_extent;
            if (diff > 0)
            {
                break;
            }

            if (collision::sphere_sphere_sql2(es, sx_, sy_, sz_, sr_) < 0)
            {
                return true;
            }
        }
        return false;
    }
}  // namespace metal_types