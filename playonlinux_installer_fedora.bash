#!/bin/bash
# ==== Fedora PlayOnLinux Installer ====
function installer_fedora() {
	POLREPFILE="/etc/yum.repos.d/playonlinux.repo"
	POLREPURL='http://rpm.playonlinux.com/playonlinux.repo'

	echo "--> Welcome to PlayOnlinux Fedora Installer <--"

	if [ "$UID" -eq "0" ]; then
		if [ -f $POLREPFILE ]; then
			yum update
			yum install playonlinux
		else
			echo '--> The installer cannot find the file '$POLREPFILE''
			echo '--> Grabbing the repo file on PlayOnLinux Server'
			curl -s $POLREPURL -o $POLREPFILE
			yum update
			yum install playonlinux
		fi
	else
		if [ -f $POLREPFILE ]; then
			su -c "yum update"
			su -c "yum install playonlinux"
		else
			echo '--> The installer cannot find the file '$POLREPFILE''
			echo '--> Grabbing the repo file on PlayOnLinux Server'
			su -c "curl -s -o $POLREPFILE $POLREPURL"
			su -c "yum update"
			su -c "yum install playonlinux"
		fi
	fi
}

if [ $(uname -s) == 'Linux' ]; then
	installer_fedora
else
	echo "Sorry, but this a PlayOnLINUX installer, your OS is not supported"
fi
