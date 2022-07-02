#!/usr/bin/env bash


# exit if not running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: You must run this script as root"
    exit 1
fi

# check prerequisite program nordvpn is installed
command -v nordvpn >/dev/null 2>&1 || {
    echo "nordvpn program not found; aborting"
    exit 1
}

echo "Starting script"

systemctl is-active --quiet nordvpn.service && {
    echo "Turning killswitch off"
    nordvpn set killswitch off
}

echo "Stopping nordvpn service"
systemctl is-active --quiet nordvpn.service && sudo systemctl stop nordvpn.service
sleep 2

echo "Stopping nordvpnd service"
systemctl is-active --quiet nordvpnd.service && sudo systemctl stop nordvpnd.service
sleep 2

echo "Flushing iptables"
sudo iptables --flush
sleep 3

echo "Restarting nordvpnd"
systemctl is-active --quiet nordvpnd.service || sudo systemctl start nordvpnd
sleep 2
echo "Restarting nordvpn"
systemctl is-active --quiet nordvpn.service || sudo systemctl start nordvpn


echo "Flushing iptables again just to be safe"
sudo iptables --flush
sleep 1

echo "Finished"
