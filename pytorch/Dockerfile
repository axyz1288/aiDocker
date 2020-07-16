FROM axyz1288/python:2.7-cuda10.1

RUN python -m pip install --no-cache-dir \
    pillow==6.2.2 \
    torch \
    torchvision \
    tensorboard \
    SimpleITK

# expose tensorboard port
EXPOSE 6006 