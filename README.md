PlayOnLinux Installers
======================

PlayOnLinux Installers - Use for your own risk ;D

## Specs
* Made in OS : Mac OS X 10.6 (a.k.a Snow Leopard)
* Tested in OS : Ubuntu 10.04 LTS, Ubuntu Server 10.04 LTS, Fedora 15, Fedora 16, Debian 6
* Supported OS : ArchLinux, Debian, Frugalware, Fedora, Ubuntu
* Language Used  : Shell Script (Bash)
* Dependencies : wget (Debian, Ubuntu), curl (Fedora), su (Debian, Fedora), sudo (ArchLinux, Frugalware, Ubuntu), apt-get (Debian, Ubuntu), apt-key (Debian, Ubuntu), yum (Fedora), pacman (ArchLinux), pacman-g2 (Frugalware)


This installers are basically the instructions from [PlayOnLinux WebSite](http://www.playonlinux.com/en/download.html), but in script.

Now with support to all Distros in the [PlayOnLinux download page](http://www.playonlinux.com/en/download.html).


Please help me testing in your system. =D


## How To
### Dependencies
All dependencies are not dependencies, are only tools that already comes standard on the system, but even so I ask that you check with verify.bash so there are no problems at installation.

#### Checking Compatibility
Please first of all run verify.bash, it only verifies that the system is able to install PlayOnLinux in the determinate Linux distribution.
```
$ ./verify.bash
--> PlayOnLinux Compatibility Tester <--
1 - Archlinux (Experimental)
2 - Debian
3 - Fedora
4 - Frugalware (Experimental)
5 - Ubuntu
0 - Exit
Choose your system:
```

### Using the 'master' installer
Just run and select your system

```
$ ./playonlinux_installer.bash
--> PlayOnLinux Installer <--
1 - Archlinux (Experimental)
2 - Debian
3 - Fedora
4 - Frugalware (Experimental)
5 - Ubuntu
0 - Exit
Choose your system: 
```

### Using the properly installer
Eg. Running the Ubuntu installer

```
$ ./playonlinux\_installer\_ubuntu.bash
--> Welcome to PlayOnLinux Ubuntu Installer <--
```


## Contribute
Feel free for contribute and report fails, I appreciate that and put your name in the section below


## Contributors
* Fernando A. Damião : Creator - [GitHub](https://github.com/fadamiao)
* Paulo Pernomian : Tester - [GitHub](https://github.com/pernomian)
