ARG BASE_IMAGE=ubuntu:20.04

FROM ${BASE_IMAGE}
LABEL maintainer="Yusu Pan <xxdsox@gmail.com>"

ENV http_proxy http://192.168.10.52:7890
ENV https_proxy http://192.168.10.52:7890

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
