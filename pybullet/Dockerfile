FROM axyz1288/ros:melodic

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    python3-pip \
    python3-setuptools \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    pybullet \
    gym
