#!/usr/bin/env bash


# check prerequisite program veracrypt is installed
command -v veracrypt >/dev/null 2>&1 || {
    echo "veracrypt program not found; aborting"
    exit 1
}


sudo veracrypt --text --dismount
# --text => use VeraCrypt in text mode (not gui mode)
# --dismount => when no values are passed in, veracrypt will attempt to dismount all volumes
