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
check_dependency "yt-dlp"

if [[ $# -ne 1 ]]; then
	echo "Error: you must provide a YouTube video url"
	echo "Usage: $0 <video_url>"
	exit 3
fi

video_url=$1

yt-dlp --write-auto-sub $video_url

echo "$0 finished"
