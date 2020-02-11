FROM continuumio/miniconda3:latest AS miniconda

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

#SHELL [ "/bin/bash", "-l", "-c" ]

RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev make
RUN apt update
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt install -y nodejs


RUN source ~/.bashrc \
 && conda create -q --name testy \
 && conda activate testy
 
RUN python3.7 -m pip install pip 
RUN pip install discord.py 
RUN npm install -g discord.js quick.db
RUN useradd -d /home/container -m container

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
