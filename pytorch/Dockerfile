FROM axyz1288/python:3.6-cuda10.1

RUN pip3 install --no-cache-dir \
    pillow==6.2.2 \
    torch \
    torchvision \
    tensorboard \
    SimpleITK

# expose tensorboard port
EXPOSE 6006 