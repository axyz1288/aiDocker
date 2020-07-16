#-------------------------------------------------------------------------------------------------------------
# Copyright (c) NCKU aiRobots . All rights reserved.
#-------------------------------------------------------------------------------------------------------------
# Reference: https://docs.nvidia.com/deeplearning/frameworks/install-tf-jetson-platform/index.html

FROM axyz1288/python:arm64

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    libhdf5-serial-dev \
    hdf5-tools \
    libhdf5-dev \
    liblapack-dev \
    libblas-dev \
    gfortran \
    && rm -rf /var/lib/apt/lists/*

# install tensorflow
RUN pip3 install --no-cache-dir --pre --extra-index-url \
    https://developer.download.nvidia.com/compute/redist/jp/v44 tensorflow \
    tensorboard == 2.1.0

EXPOSE 6006