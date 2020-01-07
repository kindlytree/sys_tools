# ssh

## 免密登录
- ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
    - -t，加密算法类型， 这里是使用rsa算法
    - -P，指定私钥的密码，不需要可以不指定
    - -f，指定生成的位置 
- 在服务器端进行配置
    - 现在我们需要做的是将A机器的公钥加入到B机器的authorized_keys文件中（可以直接拷贝粘贴，如果 authorized_keys文件不存在的话，就在B机器中新建~/.ssh/authorized_keys），然后开启开启B机器的 PubkeyAuthentication的选项
    - vi /etc/ssh/sshd_config
        - 设置下面的选项：
        - PubkeyAuthentication yes
        - 重启sshd service sshd restart
        - 这个时候就可以在A机器上ssh登录B 机器了，现在不需要输入用户对应的linux密码了，但是需要输入创建私钥的时候所输入的passphrase，但是这个密码无须在网络上进行传输了。
- 生成的内容
    - 其中id_rsa为私钥 id_rsa.pub为公钥
    - known_hosts文件，它是用来保存以前远程登录过的主机的公钥的

另外，将公钥拷贝到服务器的~/.ssh/authorized_keys文件中方法有如下几种：
1、将公钥通过scp拷贝到服务器上，然后追加到~/.ssh/authorized_keys文件中，这种方式比较麻烦。scp -P 22 ~/.ssh/id_rsa.pub user@host:~/。
2、通过ssh-copy-id程序，就是我演示的方法，ssh-copyid user@host即可
3、可以通过cat ~/.ssh/id_rsa.pub | ssh -p 22 user@host ‘cat >> ~/.ssh/authorized_keys’，这个也是比较常用的方法，因为可以更改端口号。

## remove 
- ssh-keygen -f "/home/lsxu/.ssh/known_hosts" -R "10.10.8.107"
