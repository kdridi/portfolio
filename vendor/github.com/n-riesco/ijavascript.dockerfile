FROM ubuntu:14.04
MAINTAINER Karim DRIDI <karim.dridi@gmail.com>

USER root
ENV USER root
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get upgrade -y && \
    apt-get install -y nodejs-legacy npm ipython ipython-notebook libzmq3-dev zsh

COPY ijavascript.git /app

WORKDIR /app
RUN npm install && \
    npm install github --save

EXPOSE 8888

CMD [ "bin/ijavascript.js", "--ip=0.0.0.0", "--port=8888" ]
