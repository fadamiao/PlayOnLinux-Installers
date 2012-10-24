#!/bin/bash
function verify() {
	ELEMENTS=0
	CONFIRMED=0
	PROGRAMS=$2

	echo "-> Testing the compatibility with $1"

	for PROGRAM in ${PROGRAMS[@]}; do
		ELEMENTS=$((ELEMENTS+1))
		if ( type -P $PROGRAM &> /dev/null ); then
			CONFIRMED=$((CONFIRMED+1))
			echo "'$PROGRAM'.... OK"
		else
			echo "I need '$PROGRAM' to run"
		fi
	done

	if [ "$CONFIRMED" -eq "$ELEMENTS" ]; then
		echo "Passed! You can run PlayOnLinux in $1"
	else
		echo "Install deps and run me after this..."
	fi
}

function menu() {
	echo "--> PlayOnLinux Compatibility Tester <--"
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
			verify ArchLinux "pacman"
		;;
		2)
			verify Debian "wget su apt-get apt-key"
		;;
		3)
			verify Fedora "curl su yum"
		;;
		4)
			verify Frugalware "pacman-g2"
		;;
		5)
			verify Ubuntu "wget sudo apt-get apt-key"
		;;
		*)
			echo "Please select a valid option"
			menu
		;;
	esac
}

if [ $(uname -s) == 'Linux' ]; then
	menu
else
	echo "Sorry, but this a PlayOnLINUX compatibility tester, your OS is not supported"
fi
