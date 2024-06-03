ARG IMAGE_NAME
ARG BASE_PACKAGE=vanilla
ARG OS_VERSION=ubuntu20.04
FROM ${IMAGE_NAME}:${BASE_PACKAGE}-runtime-${OS_VERSION}

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

ENV http_proxy ''
ENV https_proxy ''