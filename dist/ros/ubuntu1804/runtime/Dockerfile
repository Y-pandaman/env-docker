ARG IMAGE_NAME
ARG BASE_PACKAGE=vanilla
ARG OS_VERSION=ubuntu18.04
FROM ${IMAGE_NAME}:${BASE_PACKAGE}-runtime-${OS_VERSION}

LABEL maintainer="Pantao Yao <pantaoyao@gmail.com>"

ENV http_proxy http://192.168.10.52:7890
ENV https_proxy http://192.168.10.52:7890

# Install ROS
ARG PACKAGE_VERSION=melodic
ARG ROS_METAPACKAGE=ros-base
ARG ROS_PYTHON=python2
ARG USE_MIRROR="true"
COPY deps/install_ros.sh /tmp/
RUN /tmp/install_ros.sh \
    "${PACKAGE_VERSION}" \
    "${ROS_METAPACKAGE}" \
    "${ROS_PYTHON}" \
    "${USE_MIRROR}"

# Setup dotfiles
RUN sed -i "s/melodic/${PACKAGE_VERSION}/g" /root/.bashrc.custom

ENV http_proxy ''
ENV https_proxy ''