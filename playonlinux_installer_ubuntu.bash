#!/bin/bash
# ==== Ubuntu PlayOnLinux Installer ====
function installer_ubuntu() {
	UBUNTU=$(lsb_release -cs)

	echo "--> Welcome to PlayOnLinux Ubuntu Installer <--"

	case $UBUNTU in
		precise|oneiric|natty|maverick|lucid)
			if [ "$UID" -eq "0" ]; then
				wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
				wget "http://deb.playonlinux.com/playonlinux_$UBUNTU.list" -O /etc/apt/sources.list.d/playonlinux.list
				apt-get update
				apt-get install playonlinux
			else
				wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
				sudo wget "http://deb.playonlinux.com/playonlinux_$UBUNTU.list" -O /etc/apt/sources.list.d/playonlinux.list
				sudo apt-get update
				sudo apt-get install playonlinux
			fi
		;;
		*)
			echo "--> Ubuntu version not supported, please visit the PlayOnLinux website http://playonlinux.com/download"
		;;
	esac
}

if [ $(uname -s) == 'Linux' ]; then
	installer_ubuntu
else
	echo "Sorry, but this a PlayOnLINUX installer, your OS is not supported"
fi
