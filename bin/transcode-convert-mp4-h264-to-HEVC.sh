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
	for f in *.mp4; do
		ffmpeg -i "$f" -c:v libx265 -preset medium -x265-params crf=28 -c:a aac -strict experimental -b:a 128k "HEVC_$f"
	done
fi

if [ $# -eq 1 ] && [ -d "$1" ]
then
	for f in $1/*.mp4; do
		ffmpeg -i "$f" -c:v libx265 -preset medium -x265-params crf=28 -c:a aac -strict experimental -b:a 128k "HEVC_$f"
	done
fi

if [ $# -eq 1 ] && [ ! -d "$1" ]
then
	ffmpeg -i "$1" -c:v libx265 -preset medium -x265-params crf=28 -c:a aac -strict experimental -b:a 128k "HEVC_$1"
fi

echo "$0 finished"
