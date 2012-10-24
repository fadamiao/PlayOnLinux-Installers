#!/bin/bash
# ==== Debian PlayOnLinux Installer ====
function installer_debian() {
	DEBIAN=$(lsb_release -cs)

	echo "--> Welcome to PlayOnLinux Debian Installer <--"

	case $DEBIAN in
		squeeze|lenny|etch)
			if [ "$UID" -eq "0" ]; then
				wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
				wget "http://deb.playonlinux.com/playonlinux_$DEBIAN.list" -O /etc/apt/sources.list.d/playonlinux.list
				apt-get update
				apt-get install playonlinux
			else
				wget -q "http://deb.playonlinux.com/public.gpg" -O- | su -c "apt-key add -"
				su -c "wget http://deb.playonlinux.com/playonlinux_$DEBIAN.list -O /etc/apt/sources.list.d/playonlinux.list"
				su -c "apt-get update"
				su -c "apt-get install playonlinux"
			fi
		;;
		*)
			echo "--> Debian version not supported, please visit the PlayOnLinux website http://playonlinux.com/download"
		;;
	esac
}

if [ $(uname -s) == 'Linux' ]; then
	installer_debian
else
	echo "Sorry, but this a PlayOnLINUX installer, your OS is not supported"
fi
