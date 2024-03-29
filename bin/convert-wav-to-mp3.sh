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
check_dependency "ffmpeg"

if [ $# -eq 0 ]
then
	for f in *.wav; do
		ffmpeg -i "$f" -b:a 256k "${f[@]/%wav/mp3}"
	done
fi

if [ $# -eq 1 ] && [ -d "$1" ]
then
	for f in $1/*.wav; do
		ffmpeg -i "$f" -b:a 256k "${f[@]/%wav/mp3}"
	done
fi

if [ $# -eq 1 ] && [ -f "$1" ]
then
	ffmpeg -i "$1" -b:a 256k "${1[@]/%wav/mp3}"
fi

echo "$0 finished"
