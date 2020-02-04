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
    - git remote add origin new-url
- git submodule
    - git submodule update --init --recursive  子模块的使用 克隆项目后，默认子模块目录下无任何内容。需要在项目根目录执行如下命令完成子模块的下载
    - How do I add a submodule to a sub-directory?
        - http://www.itkeyword.com/doc/0367233012900956x413/how-do-i-add-a-submodule-to-a-sub-directory

- 删除远程分支
    $ git push origin --delete remote_branch_name
- 删除本地分支
    $ git branch -d branch_name
- rebase 变基
    切换到当前修改的分支上
    $ git checkout modify_branch
    $ git rebase master(需要merge的分支)
    $ git chechout master
    $ git merge modify_branch (完成merge)

- 查看历史提交
    $ git log
    $ git log -n (n为最近提交的次数，即查看最近提交的记录)
    $ git log -p (查看提交的内容差异)

- 回滚之前的commit
    查看之前commit的id
    $ git log 
    回滚到之前的版本
    $ git reset --hard xxxxx(id)
- 撤销commit
    1> 提交信息写错：
    $ git commit -m"initial commit"
    $ git commit --amend(立即执行，重新新commit info)
    2> 漏添加文件
    $ git commit -m"initial commit"
    $ git add forgotten_file
    $ git commit --amend(终你只会有一个提交——第二次提交将代替第一次提交的结果)
- 取消暂存文件
    7.1 
    https://git-scm.com/book/zh/v2/Git-%E5%9F%BA%E7%A1%80-%E6%92%A4%E6%B6%88%E6%93%8D%E4%BD%9C

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

## git 拉取所有分之代码到本地
- git fetch --all/-a



 
