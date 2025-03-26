# This is a docker overlay for 'Goal-Driven Deep RL Policy for Robot Navigation' project
## How to run
1. Clone this repo into desired folder: `git clone https://github.com/nikita1323/deep-rl-navigation-docker.git`
2. Go into cloned repo folder: `cd deep-rl-navigation-docker`
3. Set permissions for bash scripts: `sudo chmod +x ./setup-env.sh ./build-docker.sh ./run-docker.sh`
4. Set some of your host machine environment variables: `. ./setup-env.sh`
At this step you can configure torch variant, i.e. with gpu support/only cpu. Default is cpu. If you choose gpu support ensure NVIDIA drivers and NVIDIA Container Toolkit are installed. See: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html
6. Build docker container: `./build-docker.sh`
7. Run docker container: `./run-docker.sh`
8. Next, whether you want to train your model or use pretrained weights (not the best) choose from the corresponding commands:
   - `ros2 launch td3 training_simulation.launch.py` for training
   - `ros2 launch td3 test_simulation.launch` for testing
9. If you wish to see the reward function plot open a new terminal and execute: `docker exec -it drl-robot-navigation-ros2-docker-container`
10. Proceed into the following directory: `cd $PROJECT_NAME/runs`
11. Execute: `tensorboard --logdir . --bind_all`
12. Now open the link appeared in the terminal and watch you agent learn
# Goal-Driven Deep RL Policy for Robot Navigation
Deep Reinforcement Learning for mobile robot navigation in ROS2 Gazebo simulator. Using Twin Delayed Deep Deterministic Policy Gradient (TD3) neural network, a robot learns to navigate to a random goal point in a simulated environment while avoiding obstacles. Trained in ROS2 Humble & Gazebo simulator with PyTorch.

![Screenshot from 2023-12-09 11-41-59](https://github.com/vishweshvhavle/deep-rl-navigation/assets/52754207/704922f1-d5c7-4665-9c31-e15169521624)

![sim2](https://github.com/vishweshvhavle/deep-rl-navigation/assets/52754207/1d9b8f3d-6d1b-4b01-a573-e380ced20679)

![sim1](https://github.com/vishweshvhavle/deep-rl-navigation/assets/52754207/334d1542-58d8-4cd4-8bb5-d6611ea33d9d)

# How To Run

Install Python 3.10, ROS2 Humble, Gazebo 11 on Ubuntu 22.04
```
git clone git@github.com:vishweshvhavle/deep-rl-navigation.git
cd deep-rl-navigation/DRL_robot_navigation_ros2/
sudo rosdep init
rosdep install --from-paths src --ignore-src -y
colcon build
cd ..
```

For Training - 
```
ros2 launch td3 train_simulation.launch.py
```

For Testing - 
```
ros2 launch td3 test_simulation.launch.py
```

# Academic Integrity
If you are currently enrolled in this course, please refer to IIIT-Delhi's Policy on Academic Integrity before referring to any of the repository contents. This repository contains the work we did as undergrads at IIIT-Delhi in CSE-564 Reinforcement Learning course. We do not encourage plagiarism of any kind.
