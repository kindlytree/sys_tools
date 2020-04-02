# Set up  wordpress
[创建流程参考](https://baike.baidu.com/item/WordPress/450615?fr=aladdin)
[install guide](https://wordpress.org/support/article/how-to-install-wordpress/)
[docker install wordpress](https://blog.csdn.net/zsf211/article/details/89765425)

## application for domain name

## application for web host

## bind domain name with web host

## download wordpress

## update dns parser

## create wordpree database

## update wordpress install/settings files

## upload wordpress to webhost

## install wp via domian name

## ** docker setup**
- [reference](https://blog.csdn.net/zsf211/article/details/89765425)
    - mysql docker install
        - docker pull mysql:5.7
        - docker run --name mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:5.7
    - wordpress install
        - docker pull wordpress
        - docker run --name wordpress --link mysql:mysql -p 8080:80 -d wordpress    

## plugins
- plugin icon on the  toolbars on the left of the web page
- 选择安装插件，搜索需要的插件
- list of plugins
    - [wordpress markdown插件](https://www.zhihu.com/question/28276750)
    - [LaTeX for WordPress插件在WordPress中写数学公式](https://www.codelast.com/%E5%8E%9F%E5%88%9B%E7%94%A8latex-for-wordpress%E6%8F%92%E4%BB%B6%E5%9C%A8wordpress%E4%B8%AD%E5%86%99%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F/)
    - [Editor.MD](https://wordpress.org/plugins/wp-editormd/)
    - [MathJax-LaTeX]()
        - [Custom MathJax location?](https://www.cnblogs.com/ipaomi/p/7682314.html)
            - /wp-content/plugins/mathjax-latex/MathJax/MathJax.js
        - ~~wget https://github.com/mathjax/MathJax/archive/master.zip~~
        -  wget https://codeload.github.com/mathjax/MathJax/zip/v2.6-latest
        - unzip v2.6-latest
        - mv MathJax-master/ /home/www/htdocs/wp-content/plugins/mathjax-latex
        - 访问 http://www.YOUR_DOMAIN.com/wp-content/plugins/mathjax-latex/MathJax/test/
        - https://www.codecogs.com/latex/eqneditor.php?lang=zh-cn

## 备案
外观-->主题编辑器-->footer.php中对应位置添加
```
<span role="separator" aria-hidden="true"></span>
<a href="http://www.beian.miit.gov.cn/">沪ICP备*******号</a> 
```
        