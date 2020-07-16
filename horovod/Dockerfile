FROM axyz1288/pytorch:python3.6-cuda10.2

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    libjpeg-dev \
    libpng-dev \
    librdmacm1 \
    libibverbs1 \
    && rm -rf /var/lib/apt/lists/*

# Install Open MPI
RUN mkdir /tmp/openmpi \
    && cd /tmp/openmpi \
    && wget https://www.open-mpi.org/software/ompi/v4.0/downloads/openmpi-4.0.0.tar.gz \
    && tar zxf openmpi-4.0.0.tar.gz \
    && cd openmpi-4.0.0 \
    && ./configure --enable-orterun-prefix-by-default \
    && make -j $(nproc) all \
    && make install \
    && ldconfig \
    && rm -rf /tmp/openmpi

# Install Horovod
RUN pip3 install --no-cache-dir future \
    && HOROVOD_GPU_ALLREDUCE=NCCL \
    HOROVOD_WITH_PYTORCH=1 \
    pip3 install --no-cache-dir \
    horovod 

# Install OpenSSH for MPI to communicate between containers
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-client \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Allow OpenSSH to talk to containers without asking for confirmation
# RUN cat /etc/ssh/ssh_config | grep -v StrictHostKeyChecking > /etc/ssh/ssh_config.new \
#     && echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config.new \
#     && mv /etc/ssh/ssh_config.new /etc/ssh/ssh_config

#=================================================
#https://github.com/horovod/horovod/blob/master/docs/docker.rst
ARG PORT=12345
EXPOSE ${port}
RUN mkdir /var/run/sshd && mkdir /root/.ssh \
    && echo 'root:123' | chpasswd \
    && sed -i 's/Port 22/Port '${PORT}'/g' /etc/ssh/sshd_config \
    && sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config \
    # SSH login fix. Otherwise user is kicked off after login
    && sed -i 's/session    required     pam_loginuid.so/session    optional    pam_loginuid.so/g' /etc/pam.d/sshd

# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile
CMD ["/usr/sbin/sshd", "-D"]
#=================================================