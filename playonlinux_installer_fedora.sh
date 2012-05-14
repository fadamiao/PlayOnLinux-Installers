#!/bin/bash
# ==== Fedora PlayOnLinux Installer ====
POLREPDIR='/etc/yum.repos.d'
POLREPFILE="$POLREPDIR/playonlinux.repo"
POLREPURL='http://rpm.playonlinux.com/playonlinux.repo'

function install_root {
	echo '--> Installing PlayOnLinux <--'
	sleep 2
	yum update
	yum install playonlinux
}

function install_common {
	echo '--> Installing PlayOnLinux <--'
	sleep 2
	su -c 'yum update'
	su -c 'yum install playonlinux'
}

function fedora_installer {
	if [ $USER = root ]; then
		if [ -f $POLREPFILE ]; then
			install_root
		else
			echo '--> The installer cannot find the file '$POLREPFILE''
			echo '--> Grabbing the repo file on PlayOnLinux Server'
			sleep 2
			wget "$POLREPURL -O $POLREPFILE"
			install_root
		fi
	else
		if [ -f $POLREPFILE ]; then
			install_common
		else
			echo '--> The installer cannot find the file '$POLREPFILE''
			echo '--> Grabbing the repo file on PlayOnLinux Server'
			sleep 2
			su -c "wget $POLREPURL -O $POLREPFILE"
			install_common
		fi
	fi
}

echo '--> Welcome to PlayOnLinux Fedora Installer <--'
sleep 2

if [ -d $POLREPDIR ]; then
	if ( type -P wget &> /dev/null ); then
		fedora_installer
	else
		echo -n '--> I need wget for download the repo file. Would you like install wget for you? (Y/n): '
		read RESPWGET

		if [ $RESPWGET = 'Y' -o $RESPWGET = 'y' ]; then
			if [ $USER = root ]; then
				yum install wget
			else
				su -c 'yum install wget'
			fi

			echo -n '--> Proceed to PlayOnLinux install? (Y/n): '
			read RESPINS

			if [ $RESPINS = 'Y' -o $RESPINS = 'y' ]; then
				fedora_installer
			else
				echo "Ok, bye..."
			fi
		else
			echo "--> Ok, I wait you download the repo file ($POLREPURL) and put in '$POLREPDIR'"
		fi
	fi
else
	echo '--> This is really the Fedora Linux? Please visit the PlayOnLinux website http://playonlinux.com'
fi
