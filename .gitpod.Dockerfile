FROM gitpod/workspace-base:latest

RUN sudo apt-get update \
 && sudo apt-get install -y gnat gprbuild curl gnupg2 lsb-release bash-completion \   
 && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add - \ 
 && sudo sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list' \
 && sudo apt-get update \
 && sudo apt-get install -y \
        ros-foxy-ros-base \
        ros-foxy-example-interfaces \
        ros-foxy-turtlesim \ 
        python3-colcon-ros \
        python3-colcon-common-extensions \ 
 && sudo apt-get clean \
 && sudo rm -rf /var/lib/apt/lists/*
