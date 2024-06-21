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

#Install qt
RUN add-apt-repository ppa:beineri/opt-qt-5.14.2-focal &&  \
    apt update && apt install -yq \
    qt514base qt514charts-no-lgpl qt514declarative  qt514quickcontrols2 qt514serialport qt514serialbus

# Install extra dependencies
RUN apt update && apt install \
    ccache \
    libassimp-dev \
    libeigen3-dev \
    libboost-all-dev \
    libyaml-cpp-dev \
    -y