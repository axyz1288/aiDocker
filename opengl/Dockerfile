FROM ubuntu:20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
	libxau6 \
	libxdmcp6 \
	libxcb1 \
	libxext6 \
	libx11-6 \
    && rm -rf /var/lib/apt/lists/*

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
        ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
        ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics,compat32,utility

RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

# Required for non-glvnd setups.
ENV LD_LIBRARY_PATH /usr/lib/x86_64-linux-gnu:/usr/lib/i386-linux-gnu${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}:/usr/local/nvidia/lib:/usr/local/nvidia/lib64

RUN apt-get update && apt-get install -y --no-install-recommends \
	libglvnd0 \
	libgl1 \
	libglx0 \
	libegl1 \
	libgles2 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/glvnd/egl_vendor.d/ && echo '\
	{\
	    "file_format_version" : "1.0.0",\
	    "ICD" : {\
		"library_path" : "libEGL_nvidia.so.0"\
	    }\
	}' > /usr/share/glvnd/egl_vendor.d/10_nvidia.json


