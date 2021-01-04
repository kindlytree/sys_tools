# VNC

```
vncserver -kill :1
tightvncserver -geometry 1920x1080

svnadmin create ~/repository
svnservr -d -r ~/repository
svn checkout svn://~repository $WORKINGDIR
svn add your file
```