#-------------------------------------------------------------------------------------------------------------
# Copyright (c) NCKU aiRobots . All rights reserved.
#-------------------------------------------------------------------------------------------------------------
# Reference: https://forums.developer.nvidia.com/t/pytorch-for-jetson-nano-version-1-5-0-now-available/72048

FROM axyz1288/python:arm64

# dependencies of pytorch
RUN apt-get -y update && apt-get -y install --no-install-recommends \
    libopenblas-base \
    libopenmpi-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \ 
    Cython \
    tensorboard

# install torch
RUN wget https://nvidia.box.com/shared/static/ncgzus5o23uck9i5oth2n8n06k340l6k.whl -O torch-1.4.0-cp36-cp36m-linux_aarch64.whl \
    && pip3 install --no-cache-dir --user \
    torch-1.4.0-cp36-cp36m-linux_aarch64.whl

# install torchvision
RUN pip3 install --no-cache-dir \
    torchvision 

EXPOSE 6006