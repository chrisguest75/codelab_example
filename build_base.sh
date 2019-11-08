#!/usr/bin/env bash
# using github fork as the docker context.

# mkdir tmp
# cd tmp
# wget https://github.com/chrisguest75/codelab-tools-fork/archive/master.tar.gz
# tar -xvf master.tar.gz 
# cp ../Dockerfile ./codelab-tools-fork-master
# cd ./codelab-tools-fork-master
# docker build -t codelabs_base:latest .

docker build -t codelabs_base:latest -f- git@github.com:chrisguest75/codelab-tools-fork.git <<< $(cat Dockerfile)
