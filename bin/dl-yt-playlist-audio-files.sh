#!/usr/bin/env bash


if [[ $# -ne 1 ]]; then
    echo "Error: specify a YouTube playlist url"
    echo "Usage: $0 <playlist_url>"
    exit 1
fi

playlist_url=$1

yt-dlp -i -f 140 -o "%(title)s.%(ext)s" $playlist_url
# -i => ignore errors
# -f 140 => download audio only
