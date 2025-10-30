#pragma once

namespace vamp::planning
{
    struct RRTStarSettings
    {
        float range = 2.;

        bool dynamic_domain = true;
        float radius = 4.;
        float alpha = 0.0001;
        float min_radius = 1.;

        float rewire_factor = 1.0;
        bool force_max_iters = false;

        std::size_t max_iterations = 100000;
        std::size_t max_samples = 100000;
    };
}  // namespace vamp::planning
