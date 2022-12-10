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
check_dependency "unrar"

if [[ $# -ne 2 ]]
then
	echo "Error: specify a rarfile path and the rarfile password"
	echo "Usage: $0 <file_path> <file_password>"
	exit 3
fi

file_path="${1}"
file_password="${2}"

unrar -p${file_password} x -r "${file_path}"
# note: unrar is stupid and it requires weird ordering of the arguments
#       -p is a switch to set the password for all files in the rarfile
#       x is a command to extract files with full (original) path
#       -r is a switch to make unrar extract subdirectories recursively (must come after x command)

echo "$0 finished"
