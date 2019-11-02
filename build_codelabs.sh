#!/usr/bin/env bash

docker stop "$(docker ps -aqf "name=codelabs")"

docker build -t codelabs:latest -f Dockerfile.codelabs .
docker run -d --rm -p 8000:80 --name codelabs codelabs
open http://localhost:8000