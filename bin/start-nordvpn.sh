#!/usr/bin/env bash


# check prerequisite program nordvpn is installed
command -v nordvpn >/dev/null 2>&1 || {
    echo "nordvpn program not found; aborting"
    exit 1
}

nordvpn set killswitch off

nordvpn c US

nordvpn set killswitch on

nordvpn status
