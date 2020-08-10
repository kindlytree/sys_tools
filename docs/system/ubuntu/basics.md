# basics
- 基础用法
    - 查看系统版本 lsb_release -a
    - 查看内核版本 uname -a
- 快捷键
    - 显示桌面 ctrl+alt+d
- 注意事项
    - sources.list一定要注意版本

## 查看磁盘
- fdisk -l(查看所有磁盘)
- df -h(查看已经挂载磁盘)

## 用户管理
查看用户列表： cat /etc/passwd
删除用户: userdel -f lsxu
添加用户: sudo adduser lsxu