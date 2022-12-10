#!/usr/bin/env bash


function check_is_root {
	if [[ $EUID -ne 0 ]]
	then
		echo "This script must be run as root."
		exit 1
	fi
}

# safety checks
check_is_root

# first ensure that you have the correct device path (replace /dev/sXX as necessary)
chown -hR nyancat /dev/sXX

echo "Now remove the micro sd card and reinsert it"
echo "After it mounts, it should not be \"readonly\" anymore"

echo "$0 finished"
