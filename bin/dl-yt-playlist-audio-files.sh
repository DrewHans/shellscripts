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

yt-dlp -i -x --audio-format mp3 -o "%(title)s.%(ext)s" $playlist_url
# -i => ignore errors
# -x => dl audio only
# --audio-format mp3 => save as mp3 with best quality available
