FROM continuumio/miniconda3:4.6.14

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev make
RUN apt update

RUN useradd -d /home/container -m container
SHELL [ "/bin/bash", "-l", "-c" ]
USER container
ENV User=container HOME=/home/container
RUN source ~/.bashrc \
 && conda create -q --name testy \
 && conda activate testy

RUN conda install -c conda-forge nodejs \
 && npm install --global --no-cache discord.js 
RUN python3.7 -m pip install pip 
RUN pip install discord.py 

WORKDIR /home/container
RUN echo 'Server setup'