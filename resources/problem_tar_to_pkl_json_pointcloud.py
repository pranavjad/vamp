from collections import defaultdict
import pickle
import re
from pathlib import Path
import tarfile
import time
from fire import Fire
import json
from tqdm import tqdm
import numpy as np
import pybullet as pb

import vamp
from vamp import pointcloud as vpc
from vamp import pybullet_interface as vpb
from vamp.transformations import (
    euler_from_matrix,
    identity_matrix,
    quaternion_from_matrix,
    quaternion_matrix,
    translation_from_matrix,
    translation_matrix
    )

from yaml import load
try:
    from yaml import CLoader as Loader
except ImportError:
    from yaml import Loader


def transform_from_yaml(tf):
    pos = translation_matrix(tf['position'])
    rot = quaternion_matrix(tf['orientation'])
    return np.dot(pos, rot)


def load_moveit_yaml_scene(data):
    objects = {'sphere': [], 'cylinder': [], 'box': []}
    for co in data['world']['collision_objects']:
        obj = {'name': co['id']}
        base_pose = identity_matrix() if 'pose' not in co else transform_from_yaml(co['pose'])
        primitive, prim_pose = co['primitives'][0], transform_from_yaml(co['primitive_poses'][0])
        pose = np.dot(base_pose, prim_pose)

        prim_type = primitive['type']
        if prim_type == 'sphere':
            obj.update({'radius': primitive['dimensions'][0]})

        elif prim_type == 'cylinder':
            obj.update({'length': primitive['dimensions'][0], 'radius': primitive['dimensions'][1]})

        elif prim_type == 'box':
            obj.update({
                'half_extents': list(map(lambda x: x / 2, primitive['dimensions'])),
                })

        else:
            raise RuntimeError(f"Invalid primitive type {prim_type}!")

        obj.update(
            {
                'position': translation_from_matrix(pose).tolist(),
                'orientation_euler_xyz': euler_from_matrix(pose),
                'orientation_quat_xyzw': quaternion_from_matrix(pose).tolist()
                }
            )
        objects[prim_type].append(obj)

    return objects


def load_moveit_yaml_request(data, joints):
    js = data['start_state']['joint_state']
    start = [js['position'][js['name'].index(j)] for j in joints]

    jgn, jgp = zip(*[(e['joint_name'], e['position']) for e in data['goal_constraints'][0]['joint_constraints']])
    goal = [jgp[jgn.index(j)] for j in joints]

    return {'start': start[:len(joints)], 'goals': [goal[:len(joints)]]}


def test_problem(vamp_module, problem):
    start = problem['start']
    goals = problem['goals']
    env = vamp.problem_dict_to_vamp(problem)

    return vamp_module.validate(start, env) and any(vamp_module.validate(goal, env) for goal in goals)


def visualize_pointclouds(robot, problems):
    vamp_module = getattr(vamp, robot)
    robot_dir = Path(__file__).parent / robot

    ordered = []
    for problem_name in sorted(problems.keys()):
        ordered.extend(
            (problem_name, p) for p in sorted(problems[problem_name], key = lambda e: e['index'])
            )

    if not ordered:
        print("No problems to visualize.")
        return

    sim = vpb.PyBulletSimulator(str(robot_dir / f"{robot}_spherized.urdf"), vamp_module.joint_names(), True)
    conn = sim.client.getConnectionInfo()
    if conn.get("connectionMethod") != pb.GUI:
        print("PyBullet is not running in GUI mode; no window will appear.")
        return

    key_next = ord('n')
    key_prev = ord('p')
    key_quit = ord('q')

    print("Launching pointcloud viewer...")
    print("Press `n` for next, `p` for previous, `q` to quit.")

    idx = 0
    while True:
        problem_name, problem_data = ordered[idx]
        filtered_pc = np.asarray(problem_data.get('filtered_pointcloud', []))

        sim.clear_pointcloud()
        if len(filtered_pc):
            sim.draw_pointcloud(filtered_pc)

        sim.client.addUserDebugText(
            text = f"{problem_name} (index {problem_data['index']})",
            textPosition = [0.0, 0.0, 1.2],
            textColorRGB = [0.0, 0.0, 0.0],
            textSize = 1.5,
            )

        while True:
            keys = sim.client.getKeyboardEvents()
            if key_quit in keys and keys[key_quit] & sim.client.KEY_WAS_TRIGGERED:
                return
            if key_next in keys and keys[key_next] & sim.client.KEY_WAS_TRIGGERED:
                idx = (idx + 1) % len(ordered)
                break
            if key_prev in keys and keys[key_prev] & sim.client.KEY_WAS_TRIGGERED:
                idx = (idx - 1) % len(ordered)
                break

            sim.client.stepSimulation()
            time.sleep(0.016)


def main(
    robot: str = "panda",
    samples_per_object: int = 10000,
    filter_radius: float = 0.02,
    filter_cull: bool = True,
    output_stem: str = "problems_pointcloud",
    visualize: bool = False,
    ):
    if robot not in vamp.robots:
        raise RuntimeError(f"Robot '{robot}' not valid!")

    vamp_module = getattr(vamp, robot)
    r_min, r_max = vamp_module.min_max_radii()

    joints = vamp_module.joint_names()
    scenes = defaultdict(list)
    requests = defaultdict(list)

    problem_dir = Path(__file__).parent / robot
    tar = tarfile.open(problem_dir / "problems.tar.bz2", "r:bz2")
    for member in tqdm(tar.getmembers()):
        if not member.isfile():
            continue

        f = tar.extractfile(member)
        if f is None:
            raise RuntimeError(f"Failed to extract {member.name} from archive!")

        _, problem, filename = member.name.split('/')
        problem = problem.replace(f"_{robot}", "")
        data = load(f.read(), Loader = Loader)
        index = int(re.findall(r'\d+', filename)[0])

        metadata = {'index': index, 'problem': problem}
        if "scene" in filename:
            scenes[problem].append(load_moveit_yaml_scene(data) | metadata)
        elif "request" in filename:
            requests[problem].append(load_moveit_yaml_request(data, joints) | metadata)
        else:
            raise RuntimeError(f"Invalid file {filename} in problem tarfile!")

    data = {'robot': robot, 'joints': joints, 'problems': {}}
    for k in scenes.keys():
        data['problems'][k] = [
            {
                **s, **r
                } for (s, r) in zip(
                    sorted(scenes[k], key = lambda e: e['index']),
                    sorted(requests[k], key = lambda e: e['index'])
                    )
            ]

        for problem in data['problems'][k]:
            problem['valid'] = test_problem(vamp_module, problem)
            (_, _, filtered_pc, _, _) = vpc.problem_dict_to_pointcloud(
                robot,
                r_min,
                r_max,
                problem,
                samples_per_object,
                filter_radius,
                filter_cull,
                )
            problem['filtered_pointcloud'] = filtered_pc

    with open(problem_dir / f'{output_stem}.pkl', 'wb') as f:
        f.write(pickle.dumps(data))

    with open(problem_dir / f'{output_stem}.json', 'w') as f:
        f.write(json.dumps(data))

    if visualize:
        visualize_pointclouds(robot, data['problems'])


if __name__ == "__main__":
    Fire(main)
