#!/bin/bash
# ==== Frugalware PlayOnLinux Installer ====
function installer_frugalware() {
	echo "--> Welcome to PlayOnLinux Frugalware Installer <--"

	if [ "$UID" -eq "0" ]; then
		pacman-g2 -S playonlinux
	else
		sudo pacman-g2 -S playonlinux
	fi
}

if [ $(uname -s) == 'Linux' ]; then
	installer_frugalware
else
	echo "Sorry, but this a PlayOnLINUX installer, your OS is not supported"
fi
