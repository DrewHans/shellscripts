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
check_dependency "ssh"

if [ ! -d "$HOME/.ssh" ]
then
	echo "Warning: $HOME/.ssh/ directory does not exist"
fi

if [ ! -f "$HOME/.ssh/id_rsa" ]
then
	echo "Warning: $HOME/.ssh/id_rsa file does not exist"
fi

ssh root@192.168.1.1
# make sure your public ssh key file has been added to the router

echo "$0 finished"
