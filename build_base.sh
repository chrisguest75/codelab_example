#!/usr/bin/env bash
# using github fork as the docker context.

# mkdir tmp
# cd tmp
# wget https://github.com/chrisguest75/codelab-tools-fork/archive/master.tar.gz
# tar -xvf master.tar.gz 
# cp ../Dockerfile ./codelab-tools-fork-master
# cd ./codelab-tools-fork-master
# docker build -t codelabs_base:latest .

# NOTE: This requires bash --version 5.0
if [[ $(echo "${BASH_VERSION}" | cut -d '.' -f 1) -ne "5" ]]; then 
    echo "This script requires bash version 5.  Current bash version is ${BASH_VERSION}" 
    echo "Attempting building in the "
    mkdir "./tmp"
    cd "./tmp" 
    wget https://github.com/chrisguest75/codelab-tools-fork/archive/master.tar.gz
    tar -xvf master.tar.gz 
    cp ../Dockerfile ./codelab-tools-fork-master
    cd "./codelab-tools-fork-master"
    docker build -t codelabs_base:latest .
else
    echo "Bash version 5 detected - ${BASH_VERSION}"
    docker build -t codelabs_base:latest -f- git@github.com:chrisguest75/codelab-tools-fork.git <<< $(cat Dockerfile)
fi
