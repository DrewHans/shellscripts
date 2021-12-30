#!/usr/bin/env bash


# check prerequisite program yt-dlp is installed
command -v yt-dlp >/dev/null 2>&1 || {
    echo "yt-dlp program not found; aborting"
    exit 1
}

if [[ $# -ne 1 ]]; then
    echo "Error: specify a YouTube video url"
    echo "Usage: $0 <video_url>"
    exit 1
fi

video_url=$1

yt-dlp --write-auto-sub $video_url
