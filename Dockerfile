FROM ubuntu:18.04

RUN apt-get update 
#& apt-get -y upgrade
RUN apt-get install wget curl git nodejs npm -y

WORKDIR /go
RUN wget https://dl.google.com/go/go1.13.3.linux-amd64.tar.gz
RUN tar -xvf go1.13.3.linux-amd64.tar.gz
RUN cp ./go/bin/go /usr/bin
ENV GOROOT=/go/go/

WORKDIR /gopath
ENV GOPATH=/gopath
RUN go get github.com/googlecodelabs/tools/claat

WORKDIR /codelabs
COPY . .

WORKDIR /codelabs/site
RUN npm install
RUN npm install gulp -g
RUN mkdir /output
RUN mkdir ./codelabs

WORKDIR /codelabs/site/codelabs

CMD ["/bin/bash", "./process-labs.sh"]
#RUN gulp dist --codelabs-dir=codelabs