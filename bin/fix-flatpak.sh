#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
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
check_dependency "flatpak"
check_not_root

flatpak --user repair

echo "$0 finished"
