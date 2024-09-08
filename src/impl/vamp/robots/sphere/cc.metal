#include <metal_stdlib>
#include <vamp/collision/environment.hh>
#include <vamp/vector.hh>
#include <vamp/collision/math.hh>

using namespace metal;

kernel void sphere_collision_check(
    constant vamp::collision::Environment<float>& environment [[buffer(0)]],
    constant float* configurations [[buffer(1)]],
    constant float sr [[buffer(2)]],
    device bool* out [[buffer(3)]],
    uint id [[thread_position_in_grid]])
{
    float sx = configurations[id * 3];
    float sy = configurations[id * 3 + 1];
    float sz = configurations[id * 3 + 2];

    const float max_extent = collision::sqrt(collision::dot_3(sx, sy, sz, sx, sy, sz)) + sr;

    bool collision_found = false;
    for (const auto &es : e.spheres)
    {
        const float diff = es.min_distance - max_extent;
        if (diff > 0)
        {
            break;
        }

        if (collision::sphere_sphere_sql2(es, sx, sy, sz, sr) < 0)
        {
            collision_found = true;
        }
    }
    results[index] = collision_found;
}

