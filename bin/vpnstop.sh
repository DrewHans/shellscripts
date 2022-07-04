#!/usr/bin/env bash


# exit if not running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: You must run this script as root"
    exit 1
fi

# check prerequisite program openvpn is installed
command -v openvpn >/dev/null 2>&1 || {
    echo "openvpn program not found; aborting"
    exit 1
}

killall openvpn

# todo: figure out how to undo the passive killswitch, if activated
