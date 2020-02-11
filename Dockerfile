FROM continuumio/miniconda3:latest AS miniconda

LABEL author="Phantom Developers" maintainer="phantomDevelopers"

SHELL [ "/bin/bash", "-l", "-c" ]


RUN apt update
RUN apt upgrade -y

RUN apt install -y software-properties-common build-essential libssl-dev
RUN apt update
RUN apt install -y curl
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
RUN nvm install stable \
    && nvm use stable

#COPY --from=miniconda /opt/conda /opt/conda
# Set correct permissions
#RUN chown -R container: /opt/conda

#RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc


# give bash access to Anaconda, then normal anaconda commands, e.g. (-q: quiet, -y: answer yes)
RUN source /home/container/.bashrc \
 && conda create -q --name testy \
 && conda activate testy \
 
RUN mkdir /node_modules 
RUN npm install --prefix / discord.js 
RUN python3.7 -m pip install pip 
RUN pip3 install discord.py 
RUN useradd -d /home/container -m container

USER container
ENV User=container HOME=/home/container

WORKDIR /home/container
