
# git submodule
- git submodule 删除及更新URL
    - 删除一个submodule
        - 1.删除 .gitsubmodule中对应submodule的条目
        - 2.删除 .git/config 中对应submodule的条目
        - 3.执行 git rm --cached {submodule_path}。注意，路径不要加后面的“/”。例如：你的submodule保存在 supports/libs/websocket/ 目录。执行命令为：git rm --cached supports/libs/websocket 

- 更新submodule的URL
    - 1.更新 .gitsubmodule中对应submodule的条目URL
    - 2.更新 .git/config 中对应submodule的条目的URL
    - 3.执行 git submodule sync

- module path的更新
- 先删除, 然后再添加
```
git submodule deinit <submodule name>
git rm <submodule folder name>
.git/config
remove reference folder from .git/modules/<name> (best to make a backup), as each folder has config file where it keeps the reference to its worktree
git submodule add <address to remote git repo> <new folder name>
git submodule add --name detectron2 https://github.com/facebookresearch/detectron2.git   inference/detection/detectron2
```