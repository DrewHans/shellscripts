#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

for a in ./*.flac; do
  ffmpeg -i "$a" -b:a 256k "${a[@]/%flac/mp3}"
done

# for single file:
# ffmpeg -i "filename.flac" -b:a 256k "newfilename.mp3"
