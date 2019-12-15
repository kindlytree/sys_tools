# docker display
This is because the container couldn't access the x11 socket of the host. so when doing the docker run, need to include these two flag.

-v /tmp/.X11-unix:/tmp/.X11-unix

-e DISPLAY=unix$DISPLAY

and after this, we need to do another operation. because the default settings of X11 only allows local users to print. so we need to change this to all users.

$ sudo apt-get install x11-xserver-utils

$ xhost +

then the problem solved. 

```
    environment:
      - DISPLAY=unix$DISPLAY
      - GDK_SCALE
      - GDK_DPI_SCALE
    volumes:
      - ../:/home/kindlytree
      - /tmp/.X11-unix:/tmp/.X11-unix
    command: "tail -f /dev/null"
```