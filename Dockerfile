FROM continuumio/miniconda3

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev make
RUN apt update
#RUN apt install -y curl
#RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
#RUN apt install -y nodejs

RUN conda create -q --name testy \
 && conda activate testy

RUN conda install -c conda-forge nodejs \
 && npm install -g --no-cache discord.js quick.db 
RUN python3.7 -m pip install pip 
RUN pip install discord.py 
RUN useradd -d /home/container -m container

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
