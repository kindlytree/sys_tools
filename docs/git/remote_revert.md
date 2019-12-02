# remote revert
- 原理：先将本地分支退回到某个commit，删除远程分支，再重新push本地分支
- Steps:
    - git checkout the_branch 切换到the_branch分支；
    - git pull 获取拉动最新的代码；
    - git branch the_branch_backup //备份一下这个分支当前的情况，创建一个新的分支(当你用这种方式创建分支的时候,分支是基于你的上一次提交建立的). 创建名为dev的分支，创建分支时需要是最新的环境，创建分支但依然停留在当前分支
    - git reset –hard the_commit_id //把the_branch本地回滚到the_commit_id
    - git push origin :the_branch //删除远程 the_branch
    - git push origin the_branch //用回滚后的本地分支重新建立远程分支
    - git push origin :the_branch_backup //如果前面都成功了，删除这个备份分支