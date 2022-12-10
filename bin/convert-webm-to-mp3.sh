#!/usr/bin/env bash


# check prerequisite program ffmpeg is installed
command -v ffmpeg >/dev/null 2>&1 || {
    echo "ffmpeg program not found; aborting"
    exit 1
}

for f in *.webm; do
  ffmpeg -i "$f" -b:a 128k "${f[@]/%webm/mp3}"
done
# note: we use 128k because webm files tend to be heavily compressed and
#       there is usually no noticable improvement by saving at 256k

# for single file:
# ffmpeg -i "filename.webm" -b:a 128k "newfilename.mp3"
