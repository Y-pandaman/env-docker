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

RUN export PATH="/opt/qt514/bin:$PATH" && \
    export LD_LIBRARY_PATH="/opt/qt514/lib:$LD_LIBRARY_PATH" && \
    export QT_PLUGIN_PATH="/opt/qt514/plugins:$QT_PLUGIN_PATH" && \
    export QML2_IMPORT_PATH="/opt/qt514/qml:$QML2_IMPORT_PATH"

RUN echo "export PATH="/opt/qt514/bin:$PATH"" >> "$HOME"/.zshrc
RUN echo "export LD_LIBRARY_PATH="/opt/qt514/lib:$LD_LIBRARY_PATH"" >> "$HOME"/.zshrc
RUN echo "export QT_PLUGIN_PATH="/opt/qt514/plugins:$QT_PLUGIN_PATH"" >> "$HOME"/.zshrc
RUN echo "export QML2_IMPORT_PATH="/opt/qt514/qml:$QML2_IMPORT_PATH"" >> "$HOME"/.zshrc

#Install OpenCV
RUN apt install libvtk7-dev -y
ARG OPENCV_VERSION=4.5.2
ARG OPENCV_CUDA_ARCH=6.1
COPY deps/install_opencv.sh /tmp/
RUN /tmp/install_opencv.sh "${OPENCV_VERSION}" "${OPENCV_CUDA_ARCH}" "${NUM_THREADS}" \
    && rm -rf /tmp/install_opencv.sh

#Install visp
RUN git clone https://github.com/lagadic/visp.git && \
    cd visp && mkdir build && cd build && \
    cmake -DUSE_CXX_STANDARD=14 .. && \
    make -j4 && make install

# Install extra dependencies
RUN apt update && apt install \
    ccache \
    libassimp-dev \
    libeigen3-dev \
    libboost-all-dev \
    libyaml-cpp-dev \
    -y
