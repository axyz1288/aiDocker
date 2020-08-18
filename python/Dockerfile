FROM vistart/cuda:10.2-cudnn7-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive

# This Dockerfile adds a non-root 'vscode' user with sudo access. However, for Linux,
# this user's GID/UID must match your local user UID/GID to avoid permission issues
# with bind mounts. Update USER_UID / USER_GID if yours is not 1000. See
# https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=aiRobots
ARG PASSWORD=aiRobots
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    apt-utils 2>&1 \
    build-essential \
    sudo \
    vim \
    cmake \
    g++ \
    git \
    wget \
    lsb-release \
    software-properties-common \
    python3-pip \
    python3-setuptools\
    python3-dev \
    ros-core-python-dev \
    && rm -rf /var/lib/apt/lists/*
    
# Add user to group
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd -s /bin/bash --uid ${USER_UID} --gid ${USER_GID} -m ${USERNAME} \
    # && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
    && echo ${USERNAME} ALL=ALL >> /etc/sudoers.d/${USERNAME} \
    && echo "${USERNAME}:${PASSWORD}" | chpasswd \
    && chmod 0440 /etc/sudoers.d/${USERNAME}

# Must reinstall, in case /usr/bin/python3: No module named pip
RUN pip3 install --upgrade pip --no-cache-dir \
    numpy \
    pandas \
    six==1.14.0 \
    matplotlib \
    jupyterlab \
    scikit-learn

EXPOSE 8888

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--NotebookApp.token=''", "--NotebookApp.password=''"]

WORKDIR /home/${USERNAME}
