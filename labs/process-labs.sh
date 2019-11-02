#!/usr/bin/env bash

for f in *.md; do 
    $GOPATH/bin/claat export $f
done

cd ../
gulp dist --codelabs-dir=codelabs

cp -RL dist/* /output
