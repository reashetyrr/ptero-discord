FROM continuumio/miniconda3:latest

LABEL author="Reashetyrr" maintainer="Reashetyrr"

RUN apt update \
 && apt upgrade -y \
 && apt install -y curl software-properties-common build-essential libssl-dev make gcc chrome \
 && apt update

RUN useradd -d /home/container -m container
SHELL [ "/bin/bash", "-l", "-c" ]

RUN mkdir /home/container/.npm-global
ENV PATH=/home/container/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/container/.npm-global

RUN curl -sL https://deb.nodesource.com/setup_19.x | bash - 
RUN apt install nodejs 

RUN source ~/.bashrc \
 && conda create -q --name testy \
 && conda activate testy

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container

