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
sudo systemctl stop nordvpn.service
sudo systemctl stop nordvpnd.service

echo "Flushing iptables"
sudo iptables --flush

echo "Restarting nordvpn"
sudo systemctl start nordvpnd
sudo systemctl start nordvpn

echo "Reconnecting to VPN server"
nordvpn c

echo "Turning killswitch on"
nordvpn set killswitch on


echo "Finished"
