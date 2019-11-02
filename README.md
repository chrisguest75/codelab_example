# README.md

```
docker build -t codelabs_base:latest -f- git@github.com:chrisguest75/codelab-tools-fork.git <<< $(cat Dockerfile)
```

```
docker run -it --entrypoint /bin/bash codelabs_base:latest
```

```
docker run -it -v $(pwd)/dist:/output -v $(pwd)/labs:/codelabs/site/codelabs --entrypoint /bin/bash codelabs_base:latest 
```

```
docker run -d --rm -p 8000:80 --name condelabs condelabs 
open http://localhost:8000/
```