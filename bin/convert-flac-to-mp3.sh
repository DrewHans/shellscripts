#!/usr/bin/env bash


# check prerequisite program ffmpeg is installed
command -v ffmpeg >/dev/null 2>&1 || {
    echo "ffmpeg program not found; aborting"
    exit 1
}

for f in *.flac; do
  ffmpeg -i "$f" -b:a 256k "${af[@]/%flac/mp3}"
done

# for single file:
# ffmpeg -i "filename.flac" -b:a 256k "newfilename.mp3"
