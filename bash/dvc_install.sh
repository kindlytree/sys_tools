#!/bin/bash

sudo wget https://dvc.org/deb/dvc.list -O /etc/apt/sources.list.d/dvc.list
sudo apt-get update
sudo apt-get install dvc 