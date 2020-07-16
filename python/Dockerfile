#-------------------------------------------------------------------------------------------------------------
# Copyright (c) NCKU aiRobots . All rights reserved.
#-------------------------------------------------------------------------------------------------------------
FROM nvcr.io/nvidia/l4t-base:r32.3.1

# This Dockerfile adds a non-root 'vscode' user with sudo access. However, for Linux,
# this user's GID/UID must match your local user UID/GID to avoid permission issues
# with bind mounts. Update USER_UID / USER_GID if yours is not 1000. See
# https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=aiRobots
ARG PASSWORD=aiRobots
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    apt-utils 2>&1 \
    sudo \
    vim \
    lsb-release \
    software-properties-common \
    gcc \
    g++ \
    git \
    python3-pip \
    python3-dev \
    python3-setuptools \
    # avoid pip setup error
    python3-wheel \
    pkg-config \
    ros-core \
    # dependencies of pillow
    libjpeg-dev \
    zlib1g-dev \
    # dependency of matplotlib 
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*
    
# Add user to group
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd -s /bin/bash --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    # && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && echo ${USERNAME} ALL=ALL >> /etc/sudoers.d/${USERNAME} \
    && echo "${USERNAME}:${PASSWORD}" | chpasswd \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

RUN pip3 install --upgrade pip --upgrade setuptools\ 
    && python3 -m pip install --no-cache-dir \
    wheel \
    numpy \
    pandas \
    matplotlib \
    pillow \
    jupyterlab 

# Install tini in order to avoid pid reap.
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /usr/bin/tini-arm64
RUN chmod +x /usr/bin/tini-arm64

WORKDIR /home/${USERNAME}
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root"]