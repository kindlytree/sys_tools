# Anaconda
- **[install]([Anaconda](https://www.anaconda.com/distribution/#linux))**
- [Ubuntu 18.04 LTS操作系统的Conda安装及配置](https://blog.csdn.net/fhxy_xzw/article/details/98595878)

## installation
- [conda: command not found](https://blog.csdn.net/weixin_38705903/article/details/86533863)

```
vim ~/.bashrc
export PATH=$PATH:/home/lsxu/anaconda3/bin
source ~/.bashrc
```


## conda常用命令
1、conda -V检验是否安装以及当前conda的版本。
2、conda list 查看安装了哪些包。
3、conda env list 或 conda info -e 查看当前存在哪些虚拟环境
4、conda update conda 检查更新当前conda

## 虚拟环境搭建

### 创建虚拟环境 
 conda create -n your_env_name python=X.X
 your_env_name : 环境名字，在Anaconda安装目录envs文件下找到；
 X.X: python版本 2.7/3.6/3.7

### 激活虚拟环境
激活虚拟环境
Linux:  source activate your_env_name
Windows: activate your_env_name

## 安装库
- [安装pytorch](https://blog.csdn.net/fkyyly/article/details/89107235)