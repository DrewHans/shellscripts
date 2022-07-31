#!/usr/bin/env bash


# exit if not running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: You must run this script as root"
    exit 1
fi

apt update

apt upgrade --yes

apt dist-upgrade --yes

apt autoremove --yes

apt autoclean --yes
