#!/usr/bin/env bash

# exit if not running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: You must run this script as root"
    exit 1
fi

echo "Starting script"


echo "Turning killswitch off"
nordvpn set killswitch off

echo "Stopping nordvpn services"
systemctl is-active --quiet nordvpn.service && sudo systemctl stop nordvpn.service
systemctl is-active --quiet nordvpnd.service && sudo systemctl stop nordvpnd.service

echo "Flushing iptables"
sudo iptables --flush

echo "Restarting nordvpn"
systemctl is-active --quiet nordvpn.service || sudo systemctl start nordvpnd
systemctl is-active --quiet nordvpnd.service || sudo systemctl start nordvpn


echo "Finished"
