#!/usr/bin/env bash


for f in *.mkv
do
    mkvmerge -o "./muxed/$f" "$f" "${f%.mkv}.ass"
done
