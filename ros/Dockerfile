#-------------------------------------------------------------------------------------------------------------
# Copyright (c) NCKU aiRobots . All rights reserved.
#-------------------------------------------------------------------------------------------------------------
FROM nvcr.io/nvidia/l4t-base:r32.4.3

ARG USERNAME=aiRobots
ARG PASSWORD=aiRobots
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ENV DEBIAN_FRONTEND=noninteractive

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_DISTRO melodic

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    apt-utils 2>&1 \
    software-properties-common \
    sudo \
    vim \
    g++ \
    gcc \
    gdb \
    make \
    cmake \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654

# Add user to group
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd -s /bin/bash -u ${USER_UID} -g ${USER_GID} -m -k /etc/skel ${USERNAME} \
    # && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL >> /etc/sudoers.d/${USERNAME} \
    && echo ${USERNAME} ALL=ALL >> /etc/sudoers.d/${USERNAME} \
    && echo "${USERNAME}:${PASSWORD}" | chpasswd \
    && chmod 0440 /etc/sudoers.d/${USERNAME} \
    && chmod 777 /home/${USERNAME}

#Install ros-full-desktop
RUN add-apt-repository "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" \
    && apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
    && apt-get -y update && apt-get -y install --no-install-recommends \
    ros-melodic-desktop-full \
	python-rosdep \ 
    && rosdep init && rosdep update --rosdistro ${ROS_DISTRO} \
    && rm -rf /var/lib/apt/lists/* 

#Install tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-arm64 /usr/bin/tini-arm64
RUN chmod +x /usr/bin/tini-arm64

COPY ./ros_entrypoint.sh /
RUN chmod a+x /ros_entrypoint.sh
WORKDIR /home/${USERNAME}
ENTRYPOINT ["/usr/bin/tini-arm64", "--", "/ros_entrypoint.sh"]
CMD ["roscore"]
