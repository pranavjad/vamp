import pickle
from pathlib import Path
import numpy as np
import pandas as pd

from fire import Fire

import vamp
from vamp import pointcloud as vpc

import matplotlib.pyplot as plt

def main(
    robot: str = "panda",                  # Robot to plan for
    planner: str = "rrtc",                 # Planner name to use
    dataset: str = "problems.pkl",         # Pickled dataset to use
    problem: str = "",                     # Problem name
    index: int = 1,                        # Problem index
    sampler_name: str = "halton",          # Sampler to use.
    skip_rng_iterations: int = 0,          # Skip a number of RNG iterations
    pointcloud: bool = False,              # Use pointcloud rather than primitive geometry
    samples_per_object: int = 10000,       # If pointcloud, samples per object to use
    filter_radius: float = 0.02,           # Filter radius for pointcloud filtering
    filter_cull: bool = True,              # Cull pointcloud around robot by maximum distance
    plot: bool = False,                    # Plot the results
    save_path: str = "ao_mbm.png",         # Save path for the plot
    **kwargs,
    ):

    if robot not in vamp.robots:
        raise RuntimeError(f"Robot {robot} does not exist in VAMP!")

    robot_dir = Path(__file__).parent.parent / 'resources' / robot
    with open(robot_dir / dataset, 'rb') as f:
        data = pickle.load(f)

    (vamp_module, planner_func, plan_settings, simp_settings) = vamp.configure_robot_and_planner_with_kwargs(
        robot,
        planner,
        force_max_iters = True,
        **kwargs,
        )

    if not problem:
        problem = list(data['problems'].keys())[0]

    if problem not in data['problems']:
        raise RuntimeError(
            f"""No problem with name {problem}!
Existing problems: {list(data['problems'].keys())}"""
            )

    problems = data['problems'][problem]
    try:
        problem_data = next(problem for problem in problems if problem['index'] == index)
    except StopIteration:
        raise RuntimeError(f"No problem in {problem} with index {index}!")

    if pointcloud:
        r_min, r_max = vamp_module.min_max_radii()
        (env, original_pc, filtered_pc, filter_time, build_time) = vpc.problem_dict_to_pointcloud(
            robot,
            r_min,
            r_max,
            problem_data,
            samples_per_object,
            filter_radius,
            filter_cull,
            )

        print(
            f"""
Original Pointcloud size: {len(original_pc)}
Filtered Pointcloud size: {len(filtered_pc)}

        Filtering Time: {filter_time * 1e-6:5.3f}ms
CAPT Construction Time: {build_time * 1e-6:5.3f}ms
            """
            )

    else:
        env = vamp.problem_dict_to_vamp(problem_data)

    start = problem_data['start']
    goals = problem_data['goals']
    true_cost = min(start.distance(goal) for goal in goals)
    valid = problem_data['valid']

    sampler = getattr(vamp_module, sampler_name)()
    sampler.skip(skip_rng_iterations)

    if valid:
        result = planner_func(start, goals, env, plan_settings, sampler)
        solved = result.solved
        all_results = []
        max_iters = np.arange(1, 100000, 1000)
        for max_iter in max_iters:
            plan_settings.max_iterations = max_iter
            result = planner_func(start, goals, env, plan_settings, sampler)
            if not result.solved:
                continue
            all_results.append(result)
        df = pd.DataFrame.from_dict(all_results)
        df["planning_time_s"] = df["planning_time"].view(np.int64) / 1e9

        print(df)
        print(f"True cost: {true_cost}")

        if plot:
            plt.figure(figsize = (10, 6))
            plt.plot(df['planning_iterations'], df['initial_path_cost'], marker = 'o')
            plt.axhline(y = true_cost, color = 'r', linestyle = '--', label = 'Straight Line Cost')
            plt.title('Iterations vs Initial Path Cost')
            plt.xlabel('Iterations')
            plt.ylabel('Initial Path Cost')
            plt.grid(True)
            plt.savefig(save_path, dpi = 300, bbox_inches = 'tight')
    else:
        print("Problem is invalid!")
        solved = False


if __name__ == "__main__":

    Fire(main)
