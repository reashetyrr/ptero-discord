FROM ubuntu:18.04

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 12.15.0

RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
	
RUN apt install -y python3.7 python3-pip 
RUN mkdir /node_modules 
RUN npm install --prefix / discord.js 
RUN python3.7 -m pip install pip 
RUN pip3 install discord.py 
RUN useradd -d /home/container -m container

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
