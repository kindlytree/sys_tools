# docker
- [doc](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- steps:
```
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


```
- docker-compose 安装(ubuntu18.04)
    - sudo apt-get install python3-pip
    - pip3 install docker-compose 
    - sudo apt install docker-compose