#!/usr/bin/env bash
# using github fork as the docker context.
docker build -t codelabs_base:latest -f- git@github.com:chrisguest75/codelab-tools-fork.git <<< $(cat Dockerfile)
