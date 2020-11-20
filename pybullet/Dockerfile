FROM axyz1288/aidocker:ros

RUN apt-get -y update && apt-get -y install --no-install-recommends \
    python3-pip \
    python3-setuptools \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    pybullet \
    gym==0.10.5

ENTRYPOINT [ "/usr/bin/tini", "--", "/ros_entrypoint.sh"]
CMD [ "sleep", "infinity" ]