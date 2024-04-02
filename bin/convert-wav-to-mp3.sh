#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}


function process_audio_file {
	ffmpeg -i "$1" -b:a 256k "${1[@]/%wav/mp3}"
}

# safety checks
check_dependency "ffmpeg"

if [ $# -eq 0 ]
then
	for f in *.flac; do
		process_audio_file "$f"
	done
fi

if [ $# -eq 1 ] && [ -d "$1" ]
then
	for f in $1/*.flac; do
		process_audio_file "$f"
	done
fi

if [ $# -eq 1 ] && [ -f "$1" ]
then
	process_audio_file "$1"
fi

echo "$0 finished"
