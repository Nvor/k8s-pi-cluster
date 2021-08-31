#!/bin/bash

# Initialize master node

echo -e "Setting up Kubernetes master.."

sudo kubeadm init --token-ttl 0

rm -r -f $HOME/.kube
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
