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
check_dependency "zip"

if [ $# -eq 0 ]
then
	for d in *; do
		if [ -d "${d}" ]
		then
			echo "Converting ${d} to cbz file"
			zip -r ./"${d}.cbz" ./"${d}"
		fi
	done
fi

if [ $# -eq 1 ] && [ -d "$1" ]
then
	echo "Converting ${1} to cbz file"
	zip -r ./"${1}.cbz" ./"${1}"
fi

if [ $# -eq 1 ] && [ -f "$1" ]
then
	echo "Error: provided argument ${1} is not a directory."
	echo "Usage: $0 <directory_path>"
	exit 3
fi

echo "$0 finished"
