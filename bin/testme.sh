#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

function check_flatpak_app_is_installed {
	if ! flatpak info "$1" > /dev/null 2>&1
	then
		echo "This script requires the flatpak app $1 to be installed."
		echo "Please use flatpak to install it (flatpak install $1)."
		exit 4
	fi
}

function check_is_root {
	if [[ $EUID -ne 0 ]]
	then
		echo "This script must be run as root."
		exit 1
	fi
}

function check_not_root {
	if [[ $EUID -eq 0 ]]
	then
		echo "This script should not be run as root."
		exit 1
	fi
}

# safety checks
# check_dependency "rsync"
# check_dependency "rsyncasdfasdf"
# check_is_root
# check_not_root

# if [[ $# -ne 1 ]]
# then
#	 echo "Error: you must provide an argument1 and an argument"
#	 echo "Usage: $0 <argument1> <argument2>"
#	 exit 3
# fi

# script logic

echo "$0 finished"
