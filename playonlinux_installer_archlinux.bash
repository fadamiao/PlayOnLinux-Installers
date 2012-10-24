#!/bin/bash
# ==== ArchLinux PlayOnLinux Installer ====
function installer_archlinux() {
	ARCH=$(uname -m)

	echo "--> Welcome to PlayOnlinux ArchLinux Installer <--"

	if [ "$UID" -eq "0" ]; then
		echo "[archlinuxfr]
	Server = http://repo.archlinux.fr/$ARCH" >> /etc/pacman.conf
		pacman -Sy playonlinux
	else
		sudo echo "[archlinuxfr]
	Server = http://repo.archlinux.fr/$ARCH" >> /etc/pacman.conf
		sudo pacman -Sy playonlinux		
	fi
}

if [ $(uname -s) == 'Linux' ]; then
	installer_archlinux
else
	echo "Sorry, but this a PlayOnLINUX installer, your OS is not supported"
fi
