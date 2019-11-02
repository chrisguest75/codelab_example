#!/usr/bin/env bash

docker build -t codelabs_base:latest -f- git@github.com:chrisguest75/codelab-tools-fork.git <<< $(cat Dockerfile)

rm -rf dist/*  

docker run -it -v $(pwd)/dist:/output -v $(pwd)/labs:/codelabs/site/codelabs codelabs_base:latest 

docker build -t codelabs:latest -f Dockerfile.codelabs .

docker run -d --rm -p 8000:80 --name codelabs codelabs
