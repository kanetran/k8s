#!/bin/bash

#!/bin/bash

# Update hệ thống
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gpg

# Thêm key của Kubernetes (repo mới)
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key \
  | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes.gpg

# Thêm repo Kubernetes mới
echo "deb [signed-by=/etc/apt/keyrings/kubernetes.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" \
  | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update lại
sudo apt update

# Cài kubeadm, kubelet, kubectl
sudo apt install -y kubelet kubeadm kubectl

# Khoá version
sudo apt-mark hold kubelet kubeadm kubectl

# Bật kubelet service
sudo systemctl enable --now kubelet
