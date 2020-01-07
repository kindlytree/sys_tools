# safety

## ufw firewall
- [reference](https://blog.csdn.net/txl910514/article/details/80787982)
- sudo ufw enable
- sudo ufw deny 22
- sudo ufw status

# strategy
- create each of users individually
- root passwd setting
    - [reference](https://www.cnblogs.com/zxingwork/p/9742149.html)
    - steps: 
        - sudo passwd root
[sudo] password for you: ---> 输入你的密码（你现在这个用户的密码）

Enter new UNIX password: ---> 设置root 密码

Retype new UNIX password: ---> 重复密码
- root用户添加
