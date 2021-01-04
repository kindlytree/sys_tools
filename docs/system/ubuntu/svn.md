
# svn
- https://blog.csdn.net/weixin_39538693/article/details/111551023
- https://blog.csdn.net/qq_40140473/article/details/99287500

```
https://blog.csdn.net/weixin_39538693/article/details/111551023
https://zhuanlan.zhihu.com/p/54758455


htpasswd -b /var/svn/repositories/passwd robinson 123456

SVN关闭命令： # sudo killall svnserve
SVN启动命令： # svnserve -d -r /home/svn/project

svnadmin create ~/repository
svnserve -d -r ~/repository
svn checkout svn://~repository $WORKINGDIR
svn add your file
svn commit -m "更新部分代码"
如果在commit时提醒auth error，则可能是svnconf中的权限设置（如write的设置）存在限制

rapid svn（Ubuntu下面的svn的客户端版本）
https://blog.csdn.net/xun527/article/details/79070975

```
