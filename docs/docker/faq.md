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

## update source

```
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bk
ADD sources.list /etc/apt/

```

## W: GPG error: https://developer.download.nvidia.cn/compute/cuda/repos/ubuntu1804/x86_64  Release: The following signatures were invalid: BADSIG F60F4B3D7FA2AF80 cudatools <cudatools@nvidia.com>
E: The repository 'https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64  Release' is not signed.

- https://github.com/NVIDIA/nvidia-docker/issues/613#issuecomment-710743190

多试几次，见mmdetection的repo里边的docker目录，在/etc/hosts里面加上相关内容试试看

## docker-compose 中的option中不支持runtime选项
- 参考docker_install.sh中的脚本，下载最新版本的docker-compose
