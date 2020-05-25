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
ExecStart=/usr/bin/dockerd --host=fd:// --add-runtime=nvidia=/usr/bin/nvidia-container-runtime
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

udo tee /etc/docker/daemon.json <<EOF
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