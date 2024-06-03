ARG IMAGE_NAME
ARG BASE_PACKAGE=vanilla
ARG OS_VERSION=ubuntu20.04
FROM ${IMAGE_NAME}:${BASE_PACKAGE}-devel-${OS_VERSION}

LABEL maintainer="Pantao Yao <pantaoyao@gmail.com>"

ENV http_proxy http://192.168.10.52:7890
ENV https_proxy http://192.168.10.52:7890

ARG NUM_THREADS=1

# Install catch2
ARG CATCH2_VERSION="v3.2.1"
COPY deps/install_catch2.sh /tmp/
RUN /tmp/install_catch2.sh \
    "${CATCH2_VERSION}" \
    "${NUM_THREADS}"

# Install ecal
RUN  add-apt-repository ppa:ecal/ecal-latest && \
    apt-get update && \
    apt-get install libprotobuf-dev protobuf-compiler ecal -y

# Install colcon
RUN pip install -U colcon-common-extensions

# Install opencv
ARG OPENCV_VERSION="4.5.2"
ARG CUDA_ARCH="8.6"
COPY deps/install_opencv.sh /tmp/
RUN /tmp/install_opencv.sh \
    "${OPENCV_VERSION}" \
    "${CUDA_ARCH}" \
    "${NUM_THREADS}"

# Install fmt
ARG FMT_VERSION="9.0.0"
COPY deps/install_fmt.sh /tmp/
RUN /tmp/install_fmt.sh "${FMT_VERSION}" "${NUM_THREADS}"

# Install absl
COPY deps/install_absl.sh /tmp/
RUN /tmp/install_absl.sh "${NUM_THREADS}"

# Install extra dependencies
RUN apt update && apt install ccache libeigen3-dev libboost-all-dev libyaml-cpp-dev -y

ENV http_proxy ''
ENV https_proxy ''