#pragma once

namespace vamp::planning
{
    struct RRTSettings
    {
        float range = 2.;
        std::size_t max_iterations = 100000;
        std::size_t max_samples = 100000;
        std::size_t rng_skip_iterations = 0;
    };
}