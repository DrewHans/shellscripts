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

# safety checks
check_dependency "flatpak"
check_dependency "modprobe"
check_flatpak_app_is_installed "com.obsproject.Studio"
check_is_root

# needed to reload the v4l2loopback kernel module (it errors after first use)
modprobe -r v4l2loopback

# launch obs and start the virtual camera automatically (and redirect STDERR to /dev/null)
flatpak run com.obsproject.Studio --startvirtualcam 2>/dev/null

echo "$0 finished"
