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

# pick a random server in the us
vpnserver=$(shuf -zen1 /etc/openvpn/ovpn_udp/us*)

openvpn \
--config $vpnserver \
--auth-user-pass /etc/openvpn/nordvpn_auth.txt \
--log /etc/openvpn/log.txt \
--daemon

# todo: figure out how to enable passive killswitch option