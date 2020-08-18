#!/bin/bash
set -e
if [ ! -f "~/.bashrc" ] 
then
	cp /etc/skel/.bashrc ~/
	echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
fi
# setup ros environment
source /opt/ros/$ROS_DISTRO/setup.bash
cd /home/${USERNAME}/Joy && catkin_make
exec "$@"
