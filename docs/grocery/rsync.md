# rsync
- [reference](https://blog.csdn.net/qq_32706349/article/details/91451053)
## Goals
The goal of rsync application is to synchronize the file/folder between local and remote machine.(including the mode of pushing to remote and pulling from remote). considering the synchronization of the files, we need to consider which side is the reference. for example, If you want the remote machine's files synchronizd with the local machine, then the local files are references.

Considering the synchronization of the files. The verson control between the source and destination file should be count.

既然是文件同步，在同步过程中必然会涉及到源和目标两文件之间版本控制的问题，例如是否要删除源主机上没有但目标上多出来的文件，目标文件比源文件更新(newer than source)时是否仍要保持同步，遇到软链接时是拷贝软链接本身还是拷贝软链接所指向的文件，目标文件已存在时是否要先对其做个备份等等。

rsync同步过程中由两部分模式组成：决定哪些文件需要同步的检查模式以及文件同步时的同步模式。

(1).检查模式是指按照指定规则来检查哪些文件需要被同步，例如哪些文件是明确被排除不传输的。默认情况下，rsync使用"quick check"算法快速检查源文件和目标文件的大小、mtime(修改时间)是否一致，如果不一致则需要传输。当然，也可以通过在rsync命令行中指定某些选项来改变quick check的检查模式，比如"--size-only"选项表示"quick check"将仅检查文件大小不同的文件作为待传输文件。rsync支持非常多的选项，其中检查模式的自定义性是非常有弹性的。

(2).同步模式是指在文件确定要被同步后，在同步过程发生之前要做哪些额外工作。例如上文所说的是否要先删除源主机上没有但目标主机上有的文件，是否要先备份已存在的目标文件，是否要追踪链接文件等额外操作。rsync也提供非常多的选项使得同步模式变得更具弹性。

相对来说，为rsync手动指定同步模式的选项更常见一些，只有在有特殊需求时才指定检查模式，因为大多数检查模式选项都可能会影响rsync的性能。

## rsync三种工作方式
以下是rsync的语法：

Local:  rsync [OPTION...] SRC... [DEST]
 
Access via remote shell:
  Pull: rsync [OPTION...] [USER@]HOST:SRC... [DEST]
  Push: rsync [OPTION...] SRC... [USER@]HOST:DEST
 
Access via rsync daemon:
  Pull: rsync [OPTION...] [USER@]HOST::SRC... [DEST]
        rsync [OPTION...] rsync://[USER@]HOST[:PORT]/SRC... [DEST]
  Push: rsync [OPTION...] SRC... [USER@]HOST::DEST
        rsync [OPTION...] SRC... rsync://[USER@]HOST[:PORT]/DEST

由此语法可知，rsync有三种工作方式：

(1).本地文件系统上实现同步。命令行语法格式为上述"Local"段的格式。

(2).本地主机使用远程shell和远程主机通信。命令行语法格式为上述"Access via remote shell"段的格式。

(3).本地主机通过网络套接字连接远程主机上的rsync daemon。命令行语法格式为上述"Access via rsync daemon"段的格式。

前两者的本质是通过管道通信，即使是远程shell。而方式(3)则是让远程主机上运行rsync服务，使其监听在一个端口上，等待客户端的连接。

但是，还有第四种工作方式：通过远程shell也能临时启动一个rsync daemon，这不同于方式(3)，它不要求远程主机上事先启动rsync服务，而是临时派生出rsync daemon，它是单用途的一次性daemon，仅用于临时读取daemon的配置文件，当此次rsync同步完成，远程shell启动的rsync daemon进程也会自动消逝。此通信方式的命令行语法格式同"Access via rsync daemon"，但要求options部分必须明确指定"--rsh"选项或其短选项"-e"。

以下是对rsync语法的简单说明，由于rsync支持一百多个选项，所以此处只介绍几个常用选项。完整的选项说明以及rsync的使用方法见我翻译的"man rsync"。

Local:  rsync [OPTION...] SRC... [DEST]
 
Access via remote shell:
  Pull: rsync [OPTION...] [USER@]HOST:SRC... [DEST]
  Push: rsync [OPTION...] SRC... [USER@]HOST:DEST
 
Access via rsync daemon:
  Pull: rsync [OPTION...] [USER@]HOST::SRC... [DEST]
        rsync [OPTION...] rsync://[USER@]HOST[:PORT]/SRC... [DEST]
  Push: rsync [OPTION...] SRC... [USER@]HOST::DEST
        rsync [OPTION...] SRC... rsync://[USER@]HOST[:PORT]/DEST
其中，第一个路径参数一定是源文件路径，即作为同步基准的一方，可以同时指定多个源文件路径。最后一个路径参数则是目标文件路径，也就是待同步方。路径的格式可以是本地路径，也可以是使用user@host:path或user@host::path的远程路径，如果主机和path路径之间使用单个冒号隔开，表示使用的是远程shell通信方式，而使用双冒号隔开的则表示的是连接rsync daemon。另外，连接rsync daemon时，还提供了URL格式的路径表述方式rsync://user@host/path。

如果仅有一个SRC或DEST参数，则将以类似于"ls -l"的方式列出源文件列表(只有一个路径参数，总会认为是源文件)，而不是复制文件。

如果对rsync不熟悉，可暂先只了解本地以及远程shell格式的user@host:path路径格式。例如：

[root@xuexi ~]# rsync /etc/fstab /tmp                # 在本地同步
[root@xuexi ~]# rsync -r /etc 172.16.10.5:/tmp       # 将本地/etc目录拷贝到远程主机的/tmp下，以保证远程/tmp目录和本地/etc保持同步
[root@xuexi ~]# rsync -r 172.16.10.5:/etc /tmp       # 将远程主机的/etc目录拷贝到本地/tmp下，以保证本地/tmp目录和远程/etc保持同步
[root@xuexi ~]# rsync /etc/                          # 列出本地/etc/目录下的文件列表
[root@xuexi ~]# rsync 172.16.10.5:/tmp/              # 列出远程主机上/tmp/目录下的文件列表
另外，使用rsync一定要注意的一点是，源路径如果是一个目录的话，带上尾随斜线和不带尾随斜线是不一样的，不带尾随斜线表示的是整个目录包括目录本身，带上尾随斜线表示的是目录中的文件，不包括目录本身。例如：

[root@xuexi ~]# rsync -a /etc /tmp
[root@xuexi ~]# rsync -a /etc/ /tmp
第一个命令会在/tmp目录下创建etc目录，而第二个命令不会在/tmp目录下创建etc目录，源路径/etc/中的所有文件都直接放在/tmp目录下。