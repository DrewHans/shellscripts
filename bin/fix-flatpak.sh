#!/usr/bin/env bash


# exit if running as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Error: You should not run this script as root"
    exit 1
fi

flatpak --user repair
