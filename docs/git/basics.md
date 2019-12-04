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

