#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

# safety checks
check_dependency "gnome-screenshot"

gnome-screenshot -f $HOME/Pictures/Screenshots/Screenshot\ $(date '+%Y-%m-%d_%H-%M-%S').png

echo "$0 finished"
