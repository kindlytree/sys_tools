## FFMpeg

## References
- https://www.it1352.com/897254.html
- sudo apt install ffmpeg
 
## 提取视频帧
  - ffmpeg -i %VIDEOFILE%  %DESTDIR%%07d.jpeg
  - ffmpeg -i hiv00151.mp4  151/%07d.jpg
  - ffmpeg -i "C:\Applications\FFMPEG\aa.mp4" "frames/out-%03d.jpg"