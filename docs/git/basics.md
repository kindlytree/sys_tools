# git

## git basic
- git init
- git add file/folder
- git remote -v 显示远程的git repo地址
- git remote add origin git_address
    - 为远端仓库所起的名字，一般都是叫origin，其实你也可以要Ceres 或者Earth
    - 不限于一个仓库，可以加多个仓库，然后push到多个仓库
- 更改remote origin
    - git remote rm origin
    - git remote add origin new-ulr
- git submodule
    - git submodule update --init --recursive  子模块的使用 克隆项目后，默认子模块目录下无任何内容。需要在项目根目录执行如下命令完成子模块的下载
    - How do I add a submodule to a sub-directory?
        - http://www.itkeyword.com/doc/0367233012900956x413/how-do-i-add-a-submodule-to-a-sub-directory


### commit
- git commit -m 'commit information'
- git commit --amend 
    - 修改上一次 commit message git commit -amend -m "new message" 但是不能是已经 push 的提交

### branch
- swith branch:  git checkout origin/master
- git checkout -b pipeline origin/pipeline  -b选项如果没有则创建



## git advanced usage


## github or gitlab issues
- 在服务器添加完公钥后报错 sign_and_send_pubkey: signing failed: agent refused operation
    - eval "$(ssh-agent -s)"
    - ssh-add

