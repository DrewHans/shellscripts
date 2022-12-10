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
	echo "Error: you must provide a YouTube playlist url"
	echo "Usage: $0 <playlist_url>"
	exit 3
fi

playlist_url=$1

yt-dlp -i -x --audio-format mp3 -o "%(title)s.%(ext)s" $playlist_url
# -i => ignore errors
# -x => dl audio only
# --audio-format mp3 => save as mp3 with best quality available

echo "$0 finished"
