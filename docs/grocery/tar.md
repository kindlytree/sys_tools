# tar shell application   
- tar cjf - logs/ |split -b 1m - logs.tar.bz2. 将logs文件分包压缩成1m大小的切片文件
- tar cjf - install/ |split -b 260m - ******.0.2.tar.bz2.
- tar -zcvf sdk.tar.gz ./sdk
- tar -zcvf ******.tar.gz ./current_folder