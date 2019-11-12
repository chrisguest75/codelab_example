summary: Debugging with Skaffold
id: building-with-skaffold
categories: codelabs
tags: build 
status: Published 
authors: ChrisGuest
Feedback Link: mailto:chris.guest
<!-- copied from  -->
<!--
TODO: 
* Add clean up kind cluster instructions 
* 
-->

# Debugging with Skaffold
<!-- ------------------------ -->
## Overview 
Duration: 1

### What You'll Learn
- Deploying a local [Kind](https://kind.sigs.k8s.io/) Cluster
- Understanding how to use [Skaffold](https://skaffold.dev/) to build and debug

Kind is "Kubernetes in Docker".  It allows for a quick local Kubnernetes cluster to be deployed runing inside a Docker container.  
Skaffold is a continuous build and deployment tool for Docker images.  


<!-- ------------------------ -->
## Kind Cluster
Duration: 5
Kind is "Kubernetes in Docker".  It allows for a quick local Kubnernetes cluster to be deployed runing inside a Docker container.  

Install GO and configure a GOPATH  
```
brew install golang
mkdir ~/gopath
export GOPATH=~/gopath
```

Install Kubectl cli tool.  
```
brew install kubectl
```

Install the Kind Cluster
```
GO111MODULE="on" go get sigs.k8s.io/kind@v0.5.1
$(go env GOPATH)/bin/kind create cluster
export KUBECONFIG="$($(go env GOPATH)/bin/kind get kubeconfig-path --name="kind")"
```

Check the cluster build with docker ps 
```
docker ps
CONTAINER ID        IMAGE                  COMMAND                  CREATED             STATUS              PORTS                                  NAMES
241d05b3344f        kindest/node:v1.15.3   "/usr/local/bin/entr…"   24 hours ago        Up 24 hours         63338/tcp, 127.0.0.1:63338->6443/tcp   kind-control-plane
```

Use kubectl to view the cluster
```
kubectl get pods --all-namespaces                          
NAMESPACE       NAME                                         READY   STATUS    RESTARTS   AGE
kube-system     coredns-5c98db65d4-2s9vm                     1/1     Running   0          24h
kube-system     coredns-5c98db65d4-q5jr8                     1/1     Running   0          24h
kube-system     etcd-kind-control-plane                      1/1     Running   0          24h
kube-system     kindnet-48f9b                                1/1     Running   1          24h
kube-system     kube-apiserver-kind-control-plane            1/1     Running   0          24h
kube-system     kube-controller-manager-kind-control-plane   1/1     Running   0          24h
kube-system     kube-proxy-55llz                             1/1     Running   0          24h
kube-system     kube-scheduler-kind-control-plane            1/1     Running   0          24h
skaffolddebug   skaffoldtest-79c9d68f79-48s7f                1/1     Running   0          4m32s
```

<!-- ------------------------ -->
## Deploy using Skaffold
Duration: 5

### Building base
To build the base container used to build the example codelabs.  
```
./build_base.sh
```

### Install Skaffold
Install Skaffold cli tool.  
```
brew install skaffold
```

### Skaffold.yaml
If you open skaffold.yaml in the repo you can see it use the ./k8s/deployment.yaml Helm chart to deploy. 

### Deploying
Once the base is built you can deploy to the Kind cluster using Skaffold.  
```
skaffold deploy
```




<!-- ------------------------ -->
## Continuous Deploy using Skaffold
Duration: 5

### Continuous deployment
Skaffold allows for a continuous build and deployment.  This works well for simple builds with small numbers of layer changes.  
```
skaffold dev --port-forward
```

### Verification
```
open http://localhost:8080
```

NOTE: cmd+shift+r on Mac to refresh the crash


<!-- ------------------------ -->
## Congratulations
Duration: 5

### Building and deploying locally
You now have the ability to test create new codelabs, build and deploy them locally to a kubernetes cluster.  