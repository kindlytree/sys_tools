# faq

## shell使用问题
- 使用sudo执行命令提示command not found
    - 使用 env |grep PATH 和 sudo env |grep PATH 发现两者变量值不一样
    - 使用 sudo vim /etc/sudoers 打开文件修改env_reset参数，然后 :wq! 退出
    - 接着修改.bashrc文件，使用vim ~/.bashrc打开，加上 alias sudo='sudo env PATH=$PATH' ，然后 :wq 退出，使用 source ~/.bashrc 重新加载

## 怎么给用户添加sudo权限
```
sudo  usermod -aG sudo username
```