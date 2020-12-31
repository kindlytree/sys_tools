# mount
- [reference](https://www.cnblogs.com/wuxinyan/p/10082651.html)
- [参考资源](https://blog.csdn.net/weixin_46108954/article/details/104364059?request_id=&utm_source=distribute.pc_feed.none-task)
- [参考资源2](https://blog.csdn.net/ku360517703/article/details/41951425)


## 格式

```
sudo fdisk -l

lsblk

sudo blkid

mkfs -t ext4 -c /dev/sdb


```


### 设备挂载

格式为
```
分区             挂载目录          文件格式   文件系统的参数   能否dump备份  是否检验扇区
/dev/sdc5       /mnt/diska           ext4        defaults            0            0

```
### UUID挂载
```
UUID                                       挂载目录   文件格式  
UUID=a8528205-7f4d-4f1f-9a5c-86f257f21958  /mnt/diskc   ext4  defaults  0 0
```

### 卷标挂载
```
卷标名                挂载目录        文件格式  
LABEL=testsdc8       /mnt/diskd         ext4    defaults        0 0
```

### 写入
```
/dev/sdc5       /mnt/diska           ext4    defaults        0 0
/dev/sdc6       /mnt/diskb           ext4    defaults        0 0
UUID=a8528205-7f4d-4f1f-9a5c-86f257f21958  /mnt/diskc  ext4 defaults  0 0
LABEL=testsdc8       /mnt/diskd      ext4    defaults        0 0
LABEL=testsdc9       /mnt/diske      ext4    defaults        0 0
```

## fstab详解
让我们对fstab的用法进行一个详细的了解。一个典型的entry有下面的fields (fields用空格或tab分开):

<file system>	<dir>	<type>	<options>	<dump>	<pass>
file system:设备名称，可以通过ls /dev查看。
dir:期望挂载的目录，这个必须已经存在。
type:指挂载设备或分区为何种文件系统类型（例如：ext2, ext3, reiserfs, xfs, jfs,smbfs, iso9660, vfat, ntfs, swap等）。
options：选项。设置一些文件系统的具体选项。这里不详细介绍，具体说明：
fat32文件系统配置如下：defaults,user,rw,codepage=936,iocharset=utf8，分配代表：默认，所有用户可以使用，可读可写，后面的一项为避免显示乱码。
ntfs文件系统配置如下：defaults,user,rw,iocharset=utf8,umask=000,nls=utf8，分配代表：默认，所有用户可以使用，可读可写，后面的一项为避免显示乱码。

dump：是dump utility用来决定是否做备份的. 大部分的用户是没有安装dump的，所以应该写为0。
pass： fsck会检查这个头目下的数字来决定检查文件系统的顺序，配置成0的话，开机将不做检查。



## 修改fstab，要root权限
# SAMSUNG-20G data files by Tony 2014.12.15
UUID=B62CA61D2CA5D89F    /media/SAMSUNG-20G    ntfs    defaults,user,rw,iocharset=utf8,umask=000,nls=utf8    0    3
# SAMSUNG-40G data files by Tony 2014.12.15
UUID=1858005D58003BCE    /media/SAMSUNG-40G    ntfs    defaults,user,rw,iocharset=utf8,umask=000,nls=utf8    0    4


```
sudo mkdir /media/home
sudo mount /dev/sdb1 /media/home
```
/dev/sda

- questions
    - [umount target is busy ](https://www.cnblogs.com/ding2016/p/9605526.html)
        - sudo lsof mounted_path
        - sudo kill -9 pids
    - [lost-mount-after-reboot]
        - sudo fdisk -ll或者 df -T
        - 编辑 /etc/fstab后加入如下面的内容后重启
        - /dev/sdb1 /mnt/lsxu/work ntfs-3g umask=000,iocharset=utf8 0 0 //(ntfs格式的磁盘)
        - /dev/sda1 /mnt/lsxu/work ext4 defaults 0 0 // (ext4格式的磁盘)
    - 注意sudo passwd root修改root密码
    - 或通过启动盘进入ubuntu，去修改/etc/fstab文件