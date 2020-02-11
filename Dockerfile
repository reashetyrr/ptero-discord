FROM continuumio/miniconda3:latest AS miniconda

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

SHELL [ "/bin/bash", "-l", "-c" ]


RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev
RUN apt update
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN nvm install \
    && nvm use

RUN mkdir /node_modules 
RUN npm install --prefix / discord.js 
RUN python3.7 -m pip install pip 
RUN pip3 install discord.py 
RUN useradd -d /home/container -m container

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
