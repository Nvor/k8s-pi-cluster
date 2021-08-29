#!/bin/sh

# Prep for creating kubernetes cluster

echo "installing k8s apt-key\n"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# install kubeadm
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubeadm
