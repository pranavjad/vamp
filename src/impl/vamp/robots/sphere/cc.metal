#include <metal_stdlib>
#include <vamp/metal/metal_types.hh>

using namespace metal;

// inline float sphere_sphere_sql2(
//     const constant metal_types::Sphere &s1,
//     float x,
//     float y,
//     float z,
//     float r)
// {
//     const float dx = s1.x - x;
//     const float dy = s1.y - y;
//     const float dz = s1.z - z;
//     return (dx * dx + dy * dy + dz * dz) - (s1.r + r) * (s1.r + r);
// }

kernel void sphere_collision_check(
    constant metal_types::Sphere* spheres [[buffer(0)]],
    constant float* configurations [[buffer(1)]],
    constant SphereCollisionKernelArgs* args [[buffer(2)]],
    device bool* out [[buffer(3)]],
    uint id [[thread_position_in_grid]])
{
    float sx = configurations[id * 3];
    float sy = configurations[id * 3 + 1];
    float sz = configurations[id * 3 + 2];
    float sr = args->sphere_robot_radius;
    // out[id] = (sx == 0 && sy == 0 && sz == 0);
    // return;
    uint num_spheres = args->num_spheres_in_environment;

    const float max_extent = sqrt(sx * sx + sy * sy + sz * sz) + sr;

    bool collision_found = false;
    for (uint i = 0; i < num_spheres; ++i)
    {
        const constant metal_types::Sphere& es = spheres[i];
        const float min_distance = sqrt(es.x * es.x + es.y * es.y + es.z * es.z) - es.r;
        const float diff = min_distance - max_extent;
        if (diff > 0)
        {
            break;
        }

        if (sphere_sphere_sql2(es, sx, sy, sz, sr) < 0)
        {
            collision_found = true;
            break;
        }
    }
    out[id] = collision_found;
}