#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

for a in ./*.wav; do
  ffmpeg -i "$a" -b:a 256k "${a[@]/%wav/mp3}"
done

# for single file:
# ffmpeg -i "filename.wav" -b:a 256k "newfilename.mp3"
