# grep, cat, find
- [参考来源](https://mp.weixin.qq.com/s?__biz=Mzg5MzAyNDI4Mw==&mid=2247484774&idx=1&sn=975da682b7073140d3b4fa982053d038&chksm=c0346412f743ed04684e99360c4b2a5283adeda7bdc4ba89e1e73d437b4ba19a3a0b86a85760&mpshare=1&scene=1&srcid=&sharer_sharetime=1581853868428&sharer_shareid=a0219cecc96d542bc67e4e19834f9520&exportkey=AYMDGC2y1XPfJ2CzR4%2Fq9%2FI%3D&pass_ticket=Igco74xbkCkih93q%2BbS9vkDRcOM6FIHV1PVWUJ0T3gA%3D#rd)

## grep "some string" file
- -i选项使我们能够在给定文件中搜索字符串时不区分大小写。它匹配“ REACT”，“ REact”和“ react”之类的词。
- 我们可以使用-c（count）标志找到与给定的字符串/模式匹配的行数。

- ![figures](../figures/grep.webp)

## cat filename
- 显示文件内容
- cat somefile > somefile2

## tail
- tail命令读取文件并输出文件的最后部分（尾巴）。

## find
find path -name filename

## echo
```
echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py
echo 'c.NotebookApp.port = 1234' >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.notebook_dir = '/home/kindlytree'"  >> /root/.jupyter/jupyter_notebook_config.py
```