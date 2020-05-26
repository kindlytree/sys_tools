# basics
## management of docer images and containers
### images
### containers
- docker ps (list the running containers of the docker)
- docker stop container_name(containerid) (stop the running container by id or name
- docker rm [-f] container_name(containerid)(remove the running container by id or name)

### images
- docker rmi imageid (remove the docker image by id)
- docker commit  0c4d0d394e7e group/name:new_tag (commit the container to new images)
- docker commit f93e8629f811 ocr/tf1.8-pytorch0.4:1.0
- docker commit -m="caffe image" -a="lsxu" 5605f61c0ac4 kindlytree/caffe:v1

## start docker
- examples:
  - nvidia-docker run --name receipt_detect -v /home:/home  -v /disk3:/disk3  -v /disk5:/disk5 -d  caffe-env:0.1 sh -c 'while true;do sleep 1;done'
  - docker exec -it receipt_detech bash

## load/save/tag
- docker save -o <path for generated tar file> <image name>
- docker load -i <path to image tar file>
- docker save -o tf1.8-pytorch0.4.tar ocr/tf1.8-pytorch0.4:1.0
- docker tag 81770697ae08 ocr/pipeline-service-tf1.8-pytorch0.4:1.0

## docker search
```
docker search ubuntu:16.04

FROM ubuntu:16.04

```


```
nvidia-docker run -idt \
    --shm-size="1g" \
    --ulimit core=-1 \
    --security-opt seccomp=unconfined \
    -v /disk1:/disk1 \
    -v /disk2:/disk2 \
    -v /disk3:/disk3 \
   -p 172.18.192.88:23334:23334 \
    ts-test:tianrang \
    sleep infinity


nvidia-docker run -idt \
    --shm-size="1g" \
    --ulimit core=-1 \
    --security-opt seccomp=unconfined \
    -v /disk1:/disk1 \
    -v /disk2:/disk2 \
    -v /disk3:/disk3 \
   ts-test:pingan06 \
    sleep infinity



nvidia-docker run -idt \
    --shm-size="1g" \
    --ulimit core=-1 \
    --security-opt seccomp=unconfined \
    ubuntu:16.0 \
    sleep infinity


nvidia-docker run -idt \
    --shm-size="1g" \
    --ulimit core=-1 \
    --security-opt seccomp=unconfined \
    ubuntu:16.0 \
    sleep infinity


nvidia-docker run -idt \
    --shm-size="1g" \
    --ulimit core=-1 \
    --security-opt seccomp=unconfined \
    gcr.io/titanium-atlas-219621/bottle_tracking_train:latest \
    sleep infinity

docker save -o mmdet_1.1.tar kindlytree/mmdet:1.1
```

## base

```
```

## reference
- [参考1](http://www.docker.org.cn/book/docker/prepare-docker-5.html)