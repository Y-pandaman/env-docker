ARG PACKAGE_VERSION=11.2.0
ARG OS_VERSION=ubuntu18.04
FROM nvidia/cuda:${PACKAGE_VERSION}-runtime-${OS_VERSION}

LABEL maintainer="Pantao Yao <pantaoyao@gmail.com>"

ENV http_proxy http://192.168.20.195:7890
ENV https_proxy http://192.168.20.195:7890

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Required to build without user prompts
ENV DEBIAN_FRONTEND=noninteractive

# Enable repository mirrors for China
ARG USE_MIRROR="true"
COPY deps/setup_apt_mirror.sh /tmp/
RUN /tmp/setup_apt_mirror.sh "${USE_MIRROR}" \
    && rm -rf /tmp/setup_apt_mirror.sh

# Setup timezone
ARG TZ="Asia/Shanghai"
COPY deps/setup_timezone.sh /tmp/
RUN /tmp/setup_timezone.sh "${TZ}" \
    && rm -rf /tmp/setup_timezone.sh

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    rsync \
    git \
    curl \
    wget

ARG NUM_THREADS=1

# Install CMake
ARG CMAKE_VERSION=3.27.8
COPY deps/install_cmake.sh /tmp/
RUN /tmp/install_cmake.sh "${CMAKE_VERSION}" "${NUM_THREADS}" \
    && rm -rf /tmp/install_cmake.sh

# Install OpenCV
ARG OPENCV_VERSION=4.6.0
ARG OPENCV_CUDA_ARCH=6.1
COPY deps/install_opencv.sh /tmp/
RUN /tmp/install_opencv.sh "${OPENCV_VERSION}" "${OPENCV_CUDA_ARCH}" "${NUM_THREADS}" \
    && rm -rf /tmp/install_opencv.sh

# Install fmt from source
ARG FMT_VERSION=9.0.0
COPY deps/install_fmt.sh /tmp/
RUN /tmp/install_fmt.sh "${FMT_VERSION}" "${NUM_THREADS}" \
    && rm -rf /tmp/install_fmt.sh

# Install absl from source
ARG ABSL_VERSION=lts_2022_06_23
COPY deps/install_absl.sh /tmp/
RUN /tmp/install_absl.sh "${ABSL_VERSION}" "${NUM_THREADS}" \
    && rm -rf /tmp/install_absl.sh

# Setup dotfiles
COPY conf/.bashrc.custom /root/
RUN echo "source ~/.bashrc.custom" >> "$HOME"/.bashrc

ENV PATH "${PATH}:/usr/local/bin"
ENV LD_LIBRARY_PATH "${LD_LIBRARY_PATH}:/usr/local/lib:/usr/lib"
ENV PYTHONPATH "${PYTHONPATH}:/usr/local/lib/python3.6/site-packages"

ENV http_proxy ''
ENV https_proxy ''