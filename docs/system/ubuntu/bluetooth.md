Ubuntu16.04配置蓝牙设备

１．输入如下命令：
sudo apt-get install blueman bluez*
vim /etc/bluetooth/main.conf
去掉行[Policy]和AutoEnable前的注释
并把AutoEnable=false,改成AutoEnable=true

sudo vi /lib/udev/rules.d/50-bluetooth-hci-auto-poweron.rules
每行都加上 # 开头，其实也可以删除了这个文件。

重启电脑，命令行输入bluetoothctl

参考：https://blog.csdn.net/ycy_dy/article/details/80715074