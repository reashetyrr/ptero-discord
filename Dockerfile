FROM continuumio/miniconda3:4.6.14

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev make gcc
RUN apt update

RUN useradd -d /home/container -m container
SHELL [ "/bin/bash", "-l", "-c" ]

RUN mkdir /home/container/.npm-global
ENV PATH=/home/container/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/container/.npm-global
ENV NPM_CONFIG_CACHE=/home/container/.npm-cache
RUN source ~/.bashrc \
 && conda create -q --name testy \
 && conda activate testy

RUN conda install -c conda-forge nodejs \
 && npm install --global discord.js node-gyp quick.db
RUN python3.7 -m pip install pip 
RUN pip install discord.py 

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
RUN echo 'Server setup'