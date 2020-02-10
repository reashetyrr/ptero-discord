FROM ubuntu:18.04

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt update
RUN apt install -y curl
SHELL ["/bin/bash", "--login", "-i", "-c"]
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN source /root/.bashrc \
    && nvm install node \
    && nvm install-latest-npm 
SHELL ["/bin/bash", "--login", "-c"]
RUN apt install -y python3.7 python3-pip 
RUN mkdir /node_modules 
RUN npm install --prefix / discord.js 
RUN python3.7 -m pip install pip 
RUN pip3 install discord.py 
RUN useradd -d /home/container -m container

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
