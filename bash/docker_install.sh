#!/bin/bash
# https://docs.docker.com/engine/install/ubuntu/
 
sudo apt-get update
sudo apt-get install -y apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common &&
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" &&
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

curl -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - &&
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) &&
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list &&
sudo apt-get update &&
sudo apt-get install -y nvidia-docker2 &&
sudo pkill -SIGHUP dockerd

sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# nvidia cuda driver installation
#sudo add-apt-repository ppa:graphics-drivers &&
#sudo apt-get update &&
#sudo apt-get install -y  nvidia-410 nvidia-settings nvidia-prime --fix-missing &&
#nvidia-smi
# sudo rm /etc/apt/sources.list.d/cuda*
# sudo apt remove --autoremove nvidia-cuda-toolkit
# sudo apt remove --autoremove nvidia-*

# sudo apt update
# sudo add-apt-repository ppa:graphics-drivers/ppa
# sudo apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F60F4B3D7FA2AF80
# sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
# sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/cuda_learn.list'

# sudo apt update
# sudo apt install cuda-10-1
# sudo apt install libcudnn7