#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

function check_is_root {
	if [[ $EUID -ne 0 ]]
	then
		echo "This script must be run as root."
		exit 1
	fi
}

# safety checks
check_dependency "veracrypt"
check_is_root

veracrypt --text --dismount
# --text => use VeraCrypt in text mode (not gui mode)
# --dismount => when no values are passed in, veracrypt will attempt to dismount all volumes

echo "$0 finished"
