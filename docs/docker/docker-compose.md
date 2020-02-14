#docker-compose

## install

```
version: '2.3'
services:
  airflow:
    build: ../../airflow/docker
    container_name: airflow
    # expose:
    #  - "8080"
    #  - "5555"
    #  - "8793"
    ports:
      - "8080:8080"
      - "5555:5555"
      - "8793:8793"
    environment:
      - DISPLAY=unix$DISPLAY
      - GDK_SCALE
      - GDK_DPI_SCALE
    volumes:
      - ../:/mmdet
      - /mnt/kindlytree/data0:/data
      - /tmp/.X11-unix:/tmp/.X11-unix      
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /usr/bin/docker:/usr/bin/docker
    command: "tail -f /dev/null"

  eval:
    build: ../../evaluation/docker/nvcaffe
    container_name: eval
    image: kindlytree/mmdet:1.1
    runtime: nvidia
    privileged: true
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /usr/bin/docker:/usr/bin/docker
    shm_size: '2gb'
    environment:
      - LANG=C.UTF-8
      - LD_LIBRARY_PATH=/home/kindlytree/lib:$LD_LIBRARY_PATH
    working_dir: '/home/user/test'
    command: "tail -f /dev/null"
```

## use
- docker-compose build
- docker-compose stop
- docker-compose up -d
- docker-compose -f ***.yml build