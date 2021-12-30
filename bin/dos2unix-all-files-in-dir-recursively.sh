#!/usr/bin/env bash


# check prerequisite program dos2unix is installed
command -v dos2unix >/dev/null 2>&1 || {
    echo "dos2unix program not found; aborting"
    exit 1
}

find ./ -type f -print0 | xargs -0 dos2unix --
