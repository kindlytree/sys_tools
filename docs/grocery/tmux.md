# tmux
- [不错的教程](http://www.ruanyifeng.com/blog/2019/10/tmux.html)
- [tmux基本用法](http://koyo922.github.io/2016/02/21/tmux/)
## 基本使用
- tmux new -s sesson-name 开启一个新的session
- tmux ls 列举已有的session

## 快捷键
- 先按ctrl+b
    - 窗口
        - c 创建一个窗口
        - n next后一个
        - p previous前一个
        - & 删除
    - 窗格
        - % 垂直分割 窗口
        - " 水平分割
        - x 关闭窗格
        - q 显示每个窗格是第几个，当数字出现的时候按数字几就选中第几个窗格
- attach/detach
    - tmux detach(先按ctrl b 然后按d键)
    - tmux attach -t session-name
    - tmux kill-session -t sesson-name

## 其他
- tmate
    - Tmate 是一个 Tmux 的管理工具，使用它不但能够轻松地创建 Tmux 会话而且还能够通过互联网把该会话共享给其他人。若要使用 Tmate 共享 Tmux 会话，

## 调整窗口大小和位置
- 所以还是用命令解决吧，C-b : 进入命令行模式，然后输入：resize-pane -R 20
- Ctrl+b ;：光标切换到上一个窗格。
- Ctrl+b o：光标切换到下一个窗格。
- Ctrl+b {：当前窗格左移。
- Ctrl+b }：当前窗格右移。
- Ctrl+b Ctrl+o：当前窗格上移。
- Ctrl+b Alt+o：当前窗格下移。
- Ctrl+b x：关闭当前窗格。

## 不同屏幕连接后大的屏幕再连出现不能显示的区域
如果两个电脑连接同一个tmux，但是他们各自的显示器大小不同，那么就会在一个显示器部分会显示灰色区。在tmux里面有个设置可以更改，在tmux里面输入命令
···
tmux set-window-option aggressive-resize on
···
再重新连接进去就可以

有时候我们的终端会小屏显示，因为其他终端在使用小屏尺寸。如何在当前终端下，断开其他终端的 tmux 连接？方法是：ctrl+b, D

使用这个命令，会列出所有连接的终端，选择一个来断开。注意，命令中是大写的 D。

## scroll in tmux
Ctrl-b then [ then you can use your normal navigation keys to scroll around (eg. Up Arrow or PgDn). Press q to quit scroll mode.
