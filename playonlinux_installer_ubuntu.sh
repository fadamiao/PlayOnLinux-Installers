#!/bin/bash
# ====== Ubuntu PlayOnLinux Installer ======
UBUNTUVERSION=$(lsb_release -c | awk '{ print $2 }')

echo "--> Welcome to PlayOnLinux Ubuntu Installer <--"
sleep 3

case $UBUNTUVERSION in
	oneiric|natty|maverick|lucid)
		wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
		sudo wget "http://deb.playonlinux.com/playonlinux_$UBUNTUVERSION.list" -O /etc/apt/sources.list.d/playonlinux.list
		sudo apt-get update
		sudo apt-get install playonlinux
	;;

	*)
		echo "--> Ubuntu Version not supported, please visit the PlayOnLinux website http://playonlinux.com"
	;;
esac
