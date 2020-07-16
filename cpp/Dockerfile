#-------------------------------------------------------------------------------------------------------------
# Copyright (c) NCKU aiRobots . All rights reserved.
#-------------------------------------------------------------------------------------------------------------
FROM axyz1288/ros:arm64

# Install Xbox driver
RUN apt-get -y update && apt-get -y install --no-install-recommends \
    xboxdrv \ 
    && rm -rf /var/lib/apt/lists/*

# Install realsense2
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE \
    && add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u \
    && apt-get -y update && apt-get -y install --no-install-recommends \
    librealsense2-utils \
    librealsense2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install SDL
RUN apt-get -y update && apt-get -y install --no-install-recommends \
    libsdl2-2.0-0 \
    libsdl2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/axyz1288/New_May /home/aiRobots/New_May \
    && usermod -a -G dialout aiRobots

ENTRYPOINT ["/usr/bin/tini-arm64", "--", "/ros_entrypoint.sh"]
CMD [ "sleep", "infinity" ]