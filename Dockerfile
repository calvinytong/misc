FROM ubuntu:16.04
MAINTAINER Calvin Tong

RUN apt-get -y update
RUN apt-get -y upgrade 
RUN mkdir -p /usr/ws

WORKDIR /usr/ws

ADD . /usr/ws

RUN /bin/bash

