# README.md
This repo demonstrates how to create your own CodeLabs and add them to self-hostable container. 

Prerequisites: Docker 

## Building
To build the base container used to build the example codelabs. 

```
./build_base.sh
```

To rebuild the codelabs using the base container

```
./build_codelabs.sh
```

## How it works
The default is configured to use my fork of the CodeLabs project.

It uses the funky git based docker context with the Dockerfile in the repo.  
This installs some prerequisites tools for building the labs.  

It requires the [process-labs.sh](labs/process-labs.sh) script to convert the markdown.  

The output in the ./dist folder is then put into a container hosting static content.