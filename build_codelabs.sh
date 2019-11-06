#!/usr/bin/env bash
if [ -z "$PORT" ];then
    PORT=8080
fi
echo "PORT=$PORT"

docker stop "$(docker ps -aqf "name=codelabs")"

docker build -t codelabs:latest -f Dockerfile.codelabs .
docker run -d --rm -p 8000:$PORT -e PORT=$PORT --name codelabs codelabs
open http://localhost:8000