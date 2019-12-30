# tag
通常在发布软件的时候打一个tag，tag会记录版本的commit号，方便后期回溯。

## related commands
- git tag
    - git tag command to list all exist tags
    - -l option to filter tag with wildcard(通配符)
        - git tag -l "v3.3.*"
            - v3.3.002-11
            - v3.3.002-12
- create tag
    - git tag tag_name to create a tag
    - -a option to create a tag with comments, the comments content is specified by -m option
        - git tag -a tagName -m "tag_name"

- examine information of the tag
    - git show tagname
        - git show v1.0    
- 