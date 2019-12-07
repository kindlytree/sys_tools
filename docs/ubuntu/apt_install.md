## apt install

## diference of apt-get aptitude
- [reference](https://askubuntu.com/questions/347898/whats-difference-of-apt-get-and-aptitude)

## aptitude
- sudo apt-get install aptitude
    - problems
        - W: Unable to read /etc/apt/preferences.d/ - DirectoryExists (2: No such file or directory)
            - [problem](https://askubuntu.com/questions/426043/recover-etc-apt-preferences-d)
            - sudo mkdir /etc/apt/preferences.d
        - E: The method driver /usr/lib/apt/methods/http could not be found.
            - sudo aptitude install apt-transport-https
            - [reference](https://blog.csdn.net/zaodui7484/article/details/86308835)
            - [download](http://ftp.nl.debian.org/debian/pool/main/a/apt/) 下载apt-transport-https_1.9.5_all.deb
        - uninstall aptitude
            - sudo dpkg -r aptitude
            - sudo dpkg -i apt-***.deb
                - error
                ```
                apt depends on libapt-pkg5.90 (>= 1.9.5); however:
                Package libapt-pkg5.90 is not installed.
                apt depends on libgnutls30 (>= 3.6.6); however:
                Version of libgnutls30:amd64 on system is 3.5.18-1ubuntu1.1.
                apt depends on libstdc++6 (>= 9); however:
                Version of libstdc++6:amd64 on system is 8.3.0-6ubuntu1~18.04.1
                ```
                - apt-get --reinstall install libapt-pkg5.0
                    - https://packages.debian.org/stable/libs/libapt-pkg5.0
                    https://packages.debian.org/buster/amd64/libapt-pkg5.0/download 选择亚洲mirror
                - https://packages.debian.org/search?keywords=libapt-pkg5.90
                - https://packages.debian.org/search?keywords=libapt-pkg5.90
                    - libapt-pkg5.90:amd64 depends on libstdc++6 (>= 9); however:
                - apt 1.8版本
                    - apt depends on libgnutls30 (>= 3.6.5); however:
                    - https://packages.ubuntu.com/bionic/amd64/libgnutls30/download
                    - https://packages.ubuntu.com/disco/amd64/libgnutls30/download
                - 最终确定下载1.6.1版本可行






## questions:
- sudo: apt: command not found
    [apt-download](http://security.ubuntu.com/ubuntu/pool/main/a/apt/) 下载最新的apt_1.9.5_amd64.deb