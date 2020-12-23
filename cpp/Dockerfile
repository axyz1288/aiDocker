FROM axyz1288/aidocker:ros

# Install Xbox driver
RUN apt-get -y update && apt-get -y install --no-install-recommends \
    xboxdrv \ 
    && rm -rf /var/lib/apt/lists/*

# Install realsense2
RUN apt-key adv --keyserver keys.gnupg.net --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE \
    && add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u \
    && apt-get -y update && apt-get -y install --no-install-recommends \
    librealsense2-dkms \
    librealsense2-utils \
    librealsense2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install SDL
RUN apt-get -y update && apt-get -y install --no-install-recommends \
    libsdl2-2.0-0 \
    libsdl2-dev \
    && rm -rf /var/lib/apt/lists/*

# enable read write
RUN usermod -a -G dialout ${USERNAME}
RUN sed -i '10 i cd /home/${USERNAME}/Joy && catkin_make' /ros_entrypoint.sh
ENTRYPOINT [ "/usr/bin/tini", "--", "/ros_entrypoint.sh"]
CMD [ "./build/Joy" ]