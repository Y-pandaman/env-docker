ARG IMAGE_NAME
ARG BASE_PACKAGE=vanilla
ARG OS_VERSION=ubuntu20.04
FROM ${IMAGE_NAME}:${BASE_PACKAGE}-devel-${OS_VERSION}

LABEL maintainer="Pantao Yao <pantaoyao@gmail.com>"

ENV http_proxy http://192.168.20.195:7890
ENV https_proxy http://192.168.20.195:7890

# Install ROS
ARG PACKAGE_VERSION=noetic
ARG ROS_METAPACKAGE=desktop-full
ARG ROS_PYTHON=python3
ARG USE_MIRROR="true"
COPY deps/install_ros.sh /tmp/
RUN /tmp/install_ros.sh \
    "${PACKAGE_VERSION}" \
    "${ROS_METAPACKAGE}" \
    "${ROS_PYTHON}" \
    "${USE_MIRROR}"

ENV http_proxy ''
ENV https_proxy ''

# Setup dotfiles
RUN sed -i "s/melodic/${PACKAGE_VERSION}/g" /root/.bashrc.custom
