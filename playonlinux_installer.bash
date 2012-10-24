#!/bin/bash
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

function installer_frugalware() {
	echo "--> Welcome to PlayOnLinux Frugalware Installer <--"

	if [ "$UID" -eq "0" ]; then
		pacman-g2 -S playonlinux
	else
		sudo pacman-g2 -S playonlinux
	fi
}

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

function installer_menu() {
	echo "--> PlayOnLinux Installer <--"
	echo "1 - Archlinux (Experimental)"
	echo "2 - Debian"
	echo "3 - Fedora"
	echo "4 - Frugalware (Experimental)"
	echo "5 - Ubuntu"
	echo "0 - Exit"
	echo -n "Choose your system: "
	read OPT

	case $OPT in
		0)
			return 0
		;;
		1)
			installer_archlinux
		;;
		2)
			installer_debian
		;;
		3)
			installer_fedora
		;;
		4)
			installer_frugalware
		;;
		5)
			installer_ubuntu
		;;
		*)
			echo "Please select a valid option"
			installer_menu
		;;
	esac
}

if [ $(uname -s) == 'Linux' ]; then
	installer_menu
else
	echo "Sorry, but this a PlayOnLINUX installer, your OS is not supported"
fi
