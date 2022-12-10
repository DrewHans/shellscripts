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

yt-dlp -i -o "%(title)s.%(ext)s" $playlist_url
# -i => ignore errors

echo "$0 finished"
