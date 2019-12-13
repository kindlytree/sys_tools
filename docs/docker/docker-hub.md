# docker hub
- [修改国内镜像](https://www.cnblogs.com/lovesKey/p/11335619.html)
```
当前可用
配置文件:vim /etc/docker/daemon.json

{
  "registry-mirrors" : [
    "http://docker.mirrors.ustc.edu.cn",
    "http://hub-mirror.c.163.com",
    "registry.docker-cn.com"
  ],
  "insecure-registries" : [
    "registry.docker-cn.com",
    "docker.mirrors.ustc.edu.cn"
  ],
  "debug" : true,
  "experimental" : true
}
20191114可用

{
  "registry-mirrors" : [
    "https://hub-mirror.c.163.com"
  ]
}
重新启动docker
systemctl restart docker
```

## docker
[reference](https://docs.docker.com/reference/)


### docker exec
[reference]https://docs.docker.com/engine/reference/commandline/exec/

### 设置环境变量
```
 docker exec -e VAR=1 ubuntu_bash bash
 ```
 ### working directory
 ```
 --workdir , -w
 ```


