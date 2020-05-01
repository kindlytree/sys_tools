# System Installation
- use boot disk to install the ubuntu system
- fill the right username, computer name
- sudo passwd root
- sudo adduser user1
- sudo passwd user1
- sudo ./ufw.sh

## Update source.list

```
sudo cp /etc/apt/sources.list /etc/apt/sources.list_backup
sudo vim /etc/apt/sources.list or mv /path/to/source.list /etc/apt/
sudo apt update
sudo apt upgrade
```