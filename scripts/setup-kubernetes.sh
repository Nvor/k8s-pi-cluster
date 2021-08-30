#!/bin/bash

# Prep for creating kubernetes cluster

# setup Docker
curl -sSL get.docker.com | sh
sudo usermod pi -aG docker

# turn off swap space (required for k8s kubelet)
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove

echo "installing k8s apt-key\n"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# install kubeadm
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubeadm

# add flags to /boot/cmdline
cg_cmds="$(head -n1 /boot/cmdline.txt) cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory"
echo $cg_cmds | sudo tee /boot/cmdline.txt

echo "Rebooting.."
sudo reboot
