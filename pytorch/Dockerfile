FROM axyz1288/aidocker:python

RUN pip3 install --no-cache-dir -f https://download.pytorch.org/whl/torch_stable.html \
    torch==1.7.0+cu110 \
    torchvision==0.8.1+cu110 \
    torchaudio===0.7.0 \ 
    tensorboard 

# expose tensorboard port
EXPOSE 6006 