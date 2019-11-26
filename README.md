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


## Testing on Kind
Deploy a cluster onto local Docker.  
```
GO111MODULE="on" go get sigs.k8s.io/kind@v0.5.1
$(go env GOPATH)/bin/kind create cluster
export KUBECONFIG="$($(go env GOPATH)/bin/kind get kubeconfig-path --name="kind")"
```

You can then merge the kubeconfig if you wish.  
```
cp ~/.kube/config ~/.kube/old-config
KUBECONFIG=/Users/[name]/.kube/kind-config-mykind:/Users/[name]/.kube/config kubectl config view --flatten > config.txt
cp ./config.txt ~/.kube/config
kubectl config get-contexts
kubectl get pods --all-namespaces
```

Now Skaffold should work against your new cluster config
```
skaffold run
skaffold delete
```

## Cleaning up kubeconfig
```
kubectl config delete-cluster mykind
kubectl config get-clusters
kubectl config delete-context kubernetes-admin@mykind
kubectl config get-contexts
```
