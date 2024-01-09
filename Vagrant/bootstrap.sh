#!/bin/bash

# Download or refresh the local package index 
echo "##### UPDATE PACKAGES #####"
sudo apt-get update

### DOCKER ###
echo "##### INSTALLING DOCKER  AND DOCKER COMPOSE #####"
#Install Docker for NO PRODUCTION ENVIROMENTS
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

#DOCKER COMPOSE
sudo apt-get install -y docker-compose-plugin
docker compose version

#Use docker without sudo
sudo groupadd docker
sudo usermod -aG docker vagrant
newgrp docker

### KUBECTL ###
echo "##### INSTALLING KUBECTL #####"
#Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

### MINIKUBE ###
echo "##### INSTALLING MINIKUBE #####"
#Install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# INSTALL HELM
echo "##### INSTALLING HELM #####"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

### ARGOCD ###
echo "##### INSTALLING ARGOCD #####"
#Install ArgoCD CLI
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

#Start minikube cluster
echo "##### STARTING MINIKUBE #####"
minikube start 

