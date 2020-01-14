# basics

管理images，container
查看跑的container
docker ps
停止container
docker stop containerid
删除container
docker rm containerID
删除image
docker rmi imageid
commit 
docker commit  0c4d0d394e7e ubuntu:new_tag

docker rmi b43c1ff384c5
docker rm 117843ade696
docker stop 117843ade69
启动
nvidia-docker run --name receipt_detect -v /home:/home  -v /disk3:/disk3  -v /disk5:/disk5 -d  caffe-env:0.1 sh -c 'while true;do sleep 1;done'
docker exec -it receipt_detech bash
docker start  receipt_detecct 
docker stop receipt_detect


docker commit f93e8629f811 ocr/tf1.8-pytorch0.4:1.0



docker教程资源
http://www.docker.org.cn/book/docker/prepare-docker-5.html
创建image
docker run -t -i ubuntu:16.04 sh
docker ps -a
docker commit -m="caffe image" -a="lsxu" 5605f61c0ac4 lsxu/caffe:v1

docker 命令
docker ps
docker image
nvidia-docker run
nvidia-docker stop name
nvidia-docker run 
nvidia-docker run --name lsxu-faster-rcnn-1 -it -v /disk2:/disk2  -d yi-base-devel:cuda8.0-cudnn60-tf1.3-ruby-nghttpx-bazel-vim sh -c 'while true;do sleep 1;done'
docker exec -it faster-rcnn bash
 Ctrl+P+Q 推出进程
docker exec -it lsxu-faster-rcnn-1 bash
caffe docker创建
add-apt-repository: command not found
apt-get install software-properties-common python-software-properties
add-apt-repository ppa:xorg-edgers/ppa
apt-get update
apt-get install nvidia-367
docker pull bvlc/caffe:gpu
docker images
显示caffe
nvidia-docker run --name caffe-env -v /disk2:/disk2 -v /disk1:/disk1 -v /disk3:/disk3 -d bvlc/caffe:gpu sh -c 'while true;do sleep 1;done'
 docker exec -it caffe-env bash
nvidia-docker run --name idcard-textboxesplusplus -v /disk2:/disk2 -v /disk1:/disk1 -v /disk3:/disk3 -d bvlc/caffe:gpu-opencv320-lxmls sh -c 'while true;do sleep 1;done'
nvidia-docker run --name textboxesplusplus -v /disk2:/disk2 -v /disk1:/disk1 -v /disk3:/disk3 -d bvlc/caffe:gpu-opencv320-textboxes-env sh -c 'while true;do sleep 1;done'
docker start textboxesplusplus
nvidia-docker run --name receipt_detect -v /home:/home  -v /disk3:/disk3  -v /disk5:/disk5 -d  caffe-env:0.1 sh -c 'while true;do sleep 1;done'
管理images，container
查看跑的container
docker ps
停止container
docker stop containerid
删除container
docker rm containerID
删除image
docker rmi imageid
commit 
docker commit  0c4d0d394e7e ubuntu:new_tag

docker rmi b43c1ff384c5
docker rm 117843ade696
docker stop 117843ade696
问题集锦
Error response from daemon: linux runtime spec devices: error gathering device information while adding custom device
linux runtime spec devices: error gathering device information while adding custom device "/dev/nvidia5"
https://github.com/NVIDIA/nvidia-docker/issues/526
docker 
docker save -o <path for generated tar file> <image name>
docker load -i <path to image tar file>
docker save -o tf1.8-pytorch0.4.tar ocr/tf1.8-pytorch0.4:1.0
88 disk1/lsxu

nvidia-docker run --name ocr-pipeline -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1 -d  ocr/tf1.8-pytorch0.4:1.0 sh -c 'while true;do sleep 1;done'
nvidia-docker run --name ocr-pipeline -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1 -d  ocr/tf1.3-pytorch0.2-ctc-pil-cv2-flask:1.0 sh -c 'while true;do sleep 1;done'




nvidia-docker run --name ocr-pipeline -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1 -d  ocr/py2-tf1.3-pytorch0.4-py3-tf1.8-pytorch0.4:1.0 sh -c 'while true;do sleep 1;done'

18/disk3


docker images 的tar文件存放位置
/disk3/lsxu/dockerimages 18


nvidia-docker run --name ocr-pipeline -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1 -d  ocr/tf1.3-pytorch0.4:1.0 sh -c 'while true;do sleep 1;done'

nvidia-docker run --name ocr-pipeline -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1 -d  ocr/pipeline-stage-2:1.0 sh -c 'while true;do sleep 1;done'

nvidia-docker run --name ocr-pipeline -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1 -d  ocr/pipeline-tf1.3-pytorch0.4:1.0 sh -c 'while true;do sleep 1;done'

nvidia-docker run --name ocr-pipeline-stage2 -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1 -d ocr/pipeline-tf1.3-pytorch0.4:1.0 sh -c 'while true;do sleep 1;done'

docker rmi -f ocr/tf1.3-pytorch0.4:1.0
docker rmi -f ocr/pipeline-tf1.3-pytorch0.4:1.0
docker tag 81770697ae08 ocr/pipeline-service-tf1.8-pytorch0.4:1.0

bash ddef.sh yirun ocr-service
bash ddef.sh yiat ocr-service

nvidia-docker run --name cascade-rcnn -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1  -p 172.18.192.18:8000:8000 -d bvlc/caffe:gpu-opencv320-textboxes-env sh -c 'while true;do sleep 1;done'


nvidia-docker run --name text-detection-train -v /home:/home  -v /disk3:/disk3  -v /disk2:/disk2  -v /disk1:/disk1  -d  ts-test:build23 sh -c 'while true;do sleep 1;done'


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



docker save -o nm_mmdet_1.1.tar nullmax/mmdet:1.1