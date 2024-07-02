ARG IMAGE_NAME
ARG BASE_PACKAGE=vanilla
ARG OS_VERSION=ubuntu20.04
FROM ${IMAGE_NAME}:${BASE_PACKAGE}-devel-${OS_VERSION}

LABEL maintainer="Pantao Yao <pantaoyao@gmail.com>"

# ENV http_proxy http://192.168.20.195:7890
# ENV https_proxy http://192.168.20.195:7890

# # Install ROS
# ARG PACKAGE_VERSION=noetic
# ARG ROS_METAPACKAGE=desktop-full
# ARG ROS_PYTHON=python3
# ARG USE_MIRROR="true"
# COPY deps/install_ros.sh /tmp/
# RUN /tmp/install_ros.sh \
#     "${PACKAGE_VERSION}" \
#     "${ROS_METAPACKAGE}" \
#     "${ROS_PYTHON}" \
#     "${USE_MIRROR}"

RUN apt update \
    && apt install wget python3-yaml -y  \
    # 安装melodic
    && echo "chooses:\n" > fish_install.yaml \
    && echo "- {choose: 1, desc: '一键安装:ROS(支持ROS和ROS2,树莓派Jetson)'}\n" >> fish_install.yaml \
    && echo "- {choose: 1, desc: 更换源继续安装}\n" >> fish_install.yaml \
    && echo "- {choose: 2, desc: 清理三方源}\n" >> fish_install.yaml \
    && echo "- {choose: 2, desc: galactic(ROS2)}\n" >> fish_install.yaml \
    && echo "- {choose: 1, desc: galactic(ROS2)桌面版}\n" >> fish_install.yaml \
    && wget http://fishros.com/install  -O fishros && /bin/bash fishros \
    # 进行最后的清理
    && rm -rf /var/lib/apt/lists/*  /tmp/* /var/tmp/* \
    && apt-get clean && apt autoclean

# ENV http_proxy ''
# ENV https_proxy ''

# Setup dotfiles
RUN sed -i "s/melodic/${PACKAGE_VERSION}/g" /root/.bashrc.custom
