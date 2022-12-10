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

mounted_volume=$1

veracrypt --text --dismount $mounted_volume

# --text => use VeraCrypt in text mode (not gui mode)
# --dismount <mounted_volume> => attempt to dismount <mounted_volume>

# Note: <mounted_volume> can be one of the following:
#	1) Path to the encrypted VeraCrypt volume (I recommend this one; safest)
#	2) Mount directory of the volume's filesystem (if mounted)
#	3) Slot number of the mounted volume (requires --slot <slot_num>)

echo "$0 finished"
