#!/usr/bin/env bash


if [[ $# -ne 1 ]]; then
    echo "Error: specify a YouTube playlist url"
    echo "Usage: $0 <playlist_url>"
    exit 1
fi

# check prerequisite program yt-dlp is installed
command -v yt-dlp >/dev/null 2>&1 || {
    echo "yt-dlp program not found; aborting"
    exit 1
}

playlist_url=$1

yt-dlp -i -o "%(title)s.%(ext)s" $playlist_url
# -i => ignore errors
