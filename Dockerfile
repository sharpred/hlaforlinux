FROM ubuntu:18.04
MAINTAINER paulatsharpred

# pre-requisites
RUN apt-get update && apt-get -y upgrade \
    && apt-get install -y apt-utils bash git wget sudo curl vim build-essential gcc-multilib g++-multilib

RUN wget http://www.plantation-productions.com/Webster/HighLevelAsm/HLAv2.16/linux64.hla.tar.gz

RUN gzip -d linux64.hla.tar.gz

RUN tar xvf linux64.hla.tar

RUN mkdir ./src /home/root

WORKDIR ./src

RUN pwd

COPY ./hw.hla .

ENV PATH="/usr/hla:$PATH"
ENV hlalib="/usr/hla/hlalib"
ENV hlainc="/usr/hla/include"
ENV hlatmp="/tmp"