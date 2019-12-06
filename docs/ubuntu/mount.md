# mount
- [reference](https://www.cnblogs.com/wuxinyan/p/10082651.html)
```
sudo mkdir /media/home
sudo mount /dev/sdb1 /media/home
```
- questions
    - [umount target is busy ](https://www.cnblogs.com/ding2016/p/9605526.html)
        - sudo lsof mounted_path
        - sudo kill -9 pids
    - [lost-mount-after-reboot]
        - sudo fdisk -ll
        - 编辑 /etc/fstab后加入如下面的内容后重启
        - /dev/sdb1 /mnt/lsxu/work ntfs-3g umask=000,iocharset=utf8 0 0


