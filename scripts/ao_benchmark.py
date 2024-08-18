import numpy as np
from pathlib import Path
import pandas as pd
import random
import copy
import vamp
from fire import Fire
import matplotlib.pyplot as plt

pd.set_option('display.max_columns', None)

# Starting configuration
start = [0., -0.785, 0., -2.356, 0., 1.571, 0.785]

# Goal configuration
goal = [2.35, 1., 0., -0.8, 0, 2.5, 0.785]

print(np.sqrt(sum([(start[i] - goal[i])**2 for i in range(len(start))])))

# Problem specification: a list of sphere centers
problem = [
    [0.55, 0, 0.25],
    [0.35, 0.35, 0.25],
    [0, 0.55, 0.25],
    [-0.55, 0, 0.25],
    [-0.35, -0.35, 0.25],
    [0, -0.55, 0.25],
    [0.35, -0.35, 0.25],
    [0.35, 0.35, 0.8],
    [0, 0.55, 0.8],
    [-0.35, 0.35, 0.8],
    [-0.55, 0, 0.8],
    [-0.35, -0.35, 0.8],
    [0, -0.55, 0.8],
    [0.35, -0.35, 0.8],
    ]


def main(
    radius: float = 0.2,
    planner: str = "rrt_star",
    **kwargs,
    ):

    (vamp_module, planner_func, plan_settings,
     simp_settings) = vamp.configure_robot_and_planner_with_kwargs("panda", planner, **kwargs)
    
    random.seed(0)
    np.random.seed(0)

    all_results = []
    spheres = [np.array(sphere) for sphere in problem]
    max_iters = np.arange(500, 10000, 250)

    env = vamp.Environment()
    for sphere in spheres:
        env.add_sphere(vamp.Sphere(sphere, radius))
    plan_settings.force_max_iters = False
    for iters in max_iters:
        plan_settings.max_iterations = iters
        plan_settings.max_samples = iters
        if vamp.panda.validate(start, env) and vamp.panda.validate(goal, env):
            result = planner_func(start, goal, env, plan_settings)
            # print(result.solved)
            if not result.solved: continue
            simple = vamp_module.simplify(result.path, env, simp_settings)
            results = vamp.results_to_dict(result, simple)
            results["iterations"] = iters
            all_results.append(results)

    df = pd.DataFrame.from_dict(all_results)

    # Convert to microseconds
    df["planning_time"] = df["planning_time"].dt.microseconds
    df["simplification_time"] = df["simplification_time"].dt.microseconds

    print(df)

    # Create the plot
    plt.figure(figsize=(10, 6))
    plt.plot(df['planning_iterations'], df['initial_path_cost'], marker='o')
    plt.title('Iterations vs Initial Path Cost')
    plt.xlabel('Iterations')
    plt.ylabel('Initial Path Cost')
    plt.grid(True)
    plt.savefig('plot.png', dpi=300, bbox_inches='tight')


if __name__ == "__main__":
    Fire(main)
