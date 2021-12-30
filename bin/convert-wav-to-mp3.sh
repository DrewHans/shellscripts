#!/usr/bin/env bash


# check prerequisite program ffmpeg is installed
command -v ffmpeg >/dev/null 2>&1 || {
    echo "ffmpeg program not found; aborting"
    exit 1
}

for a in *.wav; do
  ffmpeg -i "$a" -b:a 256k "${a[@]/%wav/mp3}"
done

# for single file:
# ffmpeg -i "filename.wav" -b:a 256k "newfilename.mp3"
