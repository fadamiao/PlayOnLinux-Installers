#!/bin/bash
# ==== Fedora PlayOnLinux Installer ====
POLREPDIR='/etc/yum.repos.d'
POLREPFILE="$POLREPDIR/playonlinux.repo"
POLREPURL='http://rpm.playonlinux.com/playonlinux.repo'

echo '--> Welcome to PlayOnLinux Fedora Installer <--'
sleep 3

if [ -d $POLREPDIR ];then

	echo '--> Grabbing the repo file on PlayOnLinux Server'
	sleep 3
	wget "$POLREPURL" -O "$POLREPFILE"

	if [ $USER = root ]; then
		if [ -f $POLREPFILE ]; then
			echo '--> Installing PlayOnLinux'
			sleep 3
			yum update
			yum install playonlinux
		else
			echo '--> The installer can not find the file '$POLREPFILE', please run the installer again'
		fi
	else
		if [ -f $POLREPFILE ]; then
			echo '--> Installing PlayOnLinux'
			sleep 3
			sudo yum update
			sudo yum install playonlinux
		else
			echo '--> The installer can not find the file '$POLREPFILE', please run the installer again'
		fi
	fi
else
	echo '--> This is really the Fedora Linux? Please visit the PlayOnLinux website http://playonlinux.com'
fi
