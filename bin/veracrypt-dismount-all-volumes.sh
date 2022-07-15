#!/usr/bin/env bash


# exit if not running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: You must run this script as root"
    exit 1
fi

# check prerequisite program veracrypt is installed
command -v veracrypt >/dev/null 2>&1 || {
    echo "veracrypt program not found; aborting"
    exit 1
}


veracrypt --text --dismount
# --text => use VeraCrypt in text mode (not gui mode)
# --dismount => when no values are passed in, veracrypt will attempt to dismount all volumes
