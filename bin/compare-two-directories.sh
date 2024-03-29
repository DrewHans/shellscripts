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
check_dependency "diff"

if [[ $# -ne 2 ]]; then
	echo "Error: you must provide two directories to compare"
	echo "Usage: $0 <dir1> <dir2>"
	exit 1
fi

dir1=$1
dir2=$2

if [ ! -d "$dir1" ]
then
	echo "$dir1 directory not found; aborting"
	exit 1
fi

if [ ! -d "$dir2" ]
then
	echo "$dir2 directory not found; aborting"
	exit 1
fi

diff -qr "$dir1" "$dir2"
# q -> report only when files differ
# r -> recursively compare any subdirectories found

# this command is useful when updating photo backups

echo "$0 finished"
