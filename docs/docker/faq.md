# docker faq

## Unknown runtime specified nvidia
- 安装nvidia-docker2
- 重启
- [注册nvidia-docker](http://keep.01ue.com/?pi=409461&_a=app&_c=index&_m=p)
```
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo tee /etc/systemd/system/docker.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd  --host=fd:// --add-runtime=nvidia=/usr/bin/nvidia-container-runtime
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

sudo tee /etc/docker/daemon.json <<EOF
{
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
sudo pkill -SIGHUP dockerd
```

## Execute docker commands without using sudo 
- [reference](https://blog.csdn.net/Best_fish/article/details/83549435)
- 1.create docker group：sudo groupadd docker
- 2.add current user to docker group：sudo gpasswd -a ${USER} docker
- 3.restart the service：sudo service docker restart
- 4.refresh docker member：newgrp - docker

## no space left on device
```
docker system prune -a
```



```
sudo apt remove docker-*


https://github.com/NVIDIA/nvidia-container-runtime#docker-engine-setup

  342  sudo mkdir -p /etc/systemd/system/docker.service.d
  343  sudo tee /etc/systemd/system/docker.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --host=fd:// --add-runtime=nvidia=/usr/bin/nvidia-container-runtime
EOF
  344  sudo systemctl daemon-reload
  345  sudo systemctl restart docker
  346  sudo tee /etc/docker/daemon.json <<EOF
{
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF
  347  sudo pkill -SIGHUP dockerd
  348  sudo systemctl restart docker
  349  systemctl status docker.service
  350  sudo apt-get install nvidia-container-runtime
  351  systemctl status docker.service
```

## how to change docker storage location
- https://evodify.com/change-docker-storage-location/

```
you need to create a JSON file /etc/docker/daemon.json with the content pointing to the new storage location:

{
"data-root": "/mnt/newlocation"
}
You can read more about daemon.json in Docker docs.

Then, restart Docker or reboot the system:

sudo systemctl restart docker
```

## unauthorized: authentication required
```
sudo docker login clobotics.azurecr.io 
```

## multi-stage build(多阶段构建)
https://docs.docker.com/develop/develop-images/multistage-build/

## how to activate conda env in docker
- https://medium.com/@chadlagore/conda-environments-with-docker-82cdc9d25754

```
RUN conda create --name Unit python=2.7
RUN /bin/bash -c  "source activate Unit"
# RUN conda activate Unit
# RUN source activate Unit

# RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
# RUN echo "conda activate Unit" >> ~/.bashrc


RUN echo "source activate Unit" > ~/.bashrc
ENV PATH /opt/conda/envs/Unit/bin:$PATH

RUN conda install -n Unit pytorch torchvision cudatoolkit=10.2 -c pytorch
```