FROM axyz1288/ros:melodic

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    python3-pip \
    python3-setuptools \
<<<<<<< HEAD
    # python3-dev \
=======
    python3-dev \
>>>>>>> e42a805c14cedabaabbaa2a1e57d9da9e0c2ecb0
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    pybullet \
    gym
