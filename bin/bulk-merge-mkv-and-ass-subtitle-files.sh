#!/usr/bin/env bash


# check prerequisite program mkvmerge is installed
command -v mkvmerge >/dev/null 2>&1 || {
    echo "mkvmerge program not found; aborting"
    exit 1
}

for f in *.mkv
do
    mkvmerge -o "./muxed/$f" "$f" "${f%.mkv}.ass"
done
