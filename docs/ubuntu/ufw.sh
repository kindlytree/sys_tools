#!/bin/bash

echo y | ufw reset
ufw enable
ufw default allow
ufw allow from 10.10.**.**  # zhangsan's IP
ufw allow from 10.10.**.**  # lisi's IP
ufw allow from 10.10.**.** # wangwu's IP
ufw allow from 10.10.**.** # zhaoliu's IP
ufw deny from any
ufw status