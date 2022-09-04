FROM pytorch/pytorch:1.10.0-cuda11.3-cudnn8-devel

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
RUN apt -y update && apt -y install git vim less python3-pip
RUN pip3 install numpy==1.19.2 \
    albumentations==0.4.3 \
    diffusers \
    opencv-python==4.1.2.30 \
    pudb==2019.2 \
    invisible-watermark \
    imageio==2.9.0 \
    imageio-ffmpeg==0.4.2 \
    pytorch-lightning==1.4.2 \
    omegaconf==2.1.1 \
    test-tube>=0.7.5 \
    streamlit>=0.73.1 \
    einops==0.3.0 \
    torch-fidelity==0.3.0 \
    transformers==4.19.2 \
    torchmetrics==0.6.0 \
    kornia==0.6
RUN pip3 install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
RUN pip3 install -e git+https://github.com/openai/CLIP.git@main#egg=clip
RUN apt install -y apt libsm6 libxext6 libxrender-dev

COPY ./ /app
WORKDIR /app
RUN pip3 install -e .

# And,
# docker run --rm -it -v $HOME/stable-diffusion:/app dream /bin/bash