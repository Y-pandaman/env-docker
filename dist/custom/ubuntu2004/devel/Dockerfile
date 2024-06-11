ARG IMAGE_NAME
ARG BASE_PACKAGE=vanilla
ARG OS_VERSION=ubuntu20.04
FROM ${IMAGE_NAME}:${BASE_PACKAGE}-devel-${OS_VERSION}

LABEL maintainer="Pantao Yao <pantaoyao@gmail.com>"

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
RUN pip install -U colcon-common-extensions -i https://mirrors.aliyun.com/pypi/simple

# Install extra dependencies
RUN apt update && apt install qtcreator \
    ccache \
    libassimp-dev \
    libeigen3-dev \
    libboost-all-dev \
    libyaml-cpp-dev \
    -y