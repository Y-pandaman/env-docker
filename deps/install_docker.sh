#!/usr/bin/env bash
###
# @Author: 姚潘涛
# @Date: 2024-04-12 14:05:08
# @LastEditors: 姚潘涛
# @LastEditTime: 2024-06-11 15:19:37
# @Description:
#
# Copyright (c) 2024 by pandaman, All Rights Reserved.
###

set -ex

install_docker() {
  # install docker
  curl https://get.docker.com | sh &&
    systemctl start docker &&
    systemctl enable docker

  # non-root user
  groupadd docker
  usermod -aG docker $USER
  warning "Please log out and log in to take effects"
  # docker run hello-world
}

install_nvidia_docker() {
  # Add the package repositories
  distribution=$(
    . /etc/os-release
    echo $ID$VERSION_ID
  ) &&
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add - &&
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | tee /etc/apt/sources.list.d/nvidia-docker.list

  # Install the package
  apt-get update && apt-get install -y nvidia-docker2
  systemctl restart docker

  # Test nvidia-smi with the latest official CUDA image
  docker run --gpus all nvidia/cuda:11.0-base nvidia-smi
}

install_docker
install_nvidia_docker
