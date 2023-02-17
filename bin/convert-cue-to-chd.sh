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
check_dependency "chdman"

if [[ $# -ne 1 ]]
then
	 echo "Error: you must provide a .cue file when calling this script"
	 echo "Usage: $0 <filename>.cue"
	 exit 3
fi

function create_chdfile {
	chdman createcd -i "$1" -o "${1[@]/%cue/chd}"
}

if [ $# -eq 0 ]
then
	for f in *.cue; do
		create_chdfile "$f"
	done
fi

if [ $# -eq 1 ] && [ -d "$1" ]
then
	for f in $1/*.cue; do
		create_chdfile "$f"
	done
fi

if [ $# -eq 1 ] && [ ! -d "$1" ]
then
	create_chdfile "$1"
fi

echo "$0 finished"
