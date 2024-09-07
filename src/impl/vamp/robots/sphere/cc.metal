#include <metal_stdlib>
using namespace metal;

kernel void sphere_collision_check(
    constant Environment& environment [[buffer(0)]],
    constant float3* configurations [[buffer(1)]],
    device bool* results [[buffer(2)]],
    uint index [[thread_position_in_grid]])
{
    
}

