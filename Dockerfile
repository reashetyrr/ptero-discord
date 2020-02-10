FROM ubuntu:18.04

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

RUN apt update \
    && apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt update \
	&& apt install -y curl \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash \
	&& export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh
    && nvm install node \
    && nvm install-latest-npm \
    && apt install -y python3.7 python3-pip \
    && mkdir /node_modules \
    && npm install --prefix / discord.js \
    && python3.7 -m pip install pip \
    && pip3 install discord.py \
    && useradd -d /home/container -m container

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
