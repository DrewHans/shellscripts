#!/usr/bin/env bash


# check prerequisite program ffmpeg is installed
command -v ffmpeg >/dev/null 2>&1 || {
    echo "ffmpeg program not found; aborting"
    exit 1
}

for a in *.flac; do
  ffmpeg -i "$a" -b:a 256k "${a[@]/%flac/mp3}"
done

# for single file:
# ffmpeg -i "filename.flac" -b:a 256k "newfilename.mp3"
