FROM continuumio/miniconda3:latest AS miniconda

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

SHELL [ "/bin/bash", "-l", "-c" ]


RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev
RUN apt update
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs


RUN source ~/.bashrc \
 && conda create -q --name testy \
 && conda activate testy
 
RUN npm install --prefix / discord.js 
RUN python3.7 -m pip install pip 
RUN pip install discord.py 
RUN useradd -d /home/container -m container

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
