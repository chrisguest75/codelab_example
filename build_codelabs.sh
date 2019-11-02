#!/usr/bin/env bash

docker stop "$(docker ps -aqf "name=codelabs")"
rm -rf dist/*  
docker run -it -v $(pwd)/dist:/output -v $(pwd)/labs:/codelabs/site/codelabs codelabs_base:latest 
#docker run -it -v $(pwd)/dist:/output -v $(pwd)/labs:/codelabs/site/codelabs --entrypoint /bin/bash codelabs_base:latest 

docker build -t codelabs:latest -f Dockerfile.codelabs .
docker run -d --rm -p 8000:80 --name codelabs codelabs
open http://localhost:8000