# sougou install
- [reference](https://blog.csdn.net/scuping/article/details/86697287)
    - downlod deb install file
    - sudo dpkg-i sogu****.deb
    - sudo apt --fix-broken install
    - sudo apt install fcitx
    - sudo apt install libqtwebkit4
```
Setting -> Region & Language -> Manage Installed Languages

把Keboard input method system从IBus修改为fcitx

在系统程序中搜索打开fcitx configuration，右下角点击添加按钮，把 Only Show Current Language取消勾选，然后选择Sougou Pinyin，然后添加进去。
```