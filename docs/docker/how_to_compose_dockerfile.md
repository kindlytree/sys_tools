# Dockerfile

## base image
```
FROM ubuntu:16.04
FROM nvidia/cuda:10.0-cudnn7-devel
(https://gitlab.com/nvidia/container-images/cuda/blob/master/doc/supported-tags.md candidate nvidia tags)

```

## ENV

```
ENV PATH /opt/conda/bin:$PATH
```