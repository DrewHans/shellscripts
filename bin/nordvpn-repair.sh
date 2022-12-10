#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

function check_is_root {
	if [[ $EUID -ne 0 ]]
	then
		echo "This script must be run as root."
		exit 1
	fi
}

# safety checks
check_dependency "iptables"
check_dependency "nordvpn"
check_dependency "systemctl"
check_is_root

echo "Starting script"

systemctl is-active --quiet nordvpn.service && {
	echo "Turning killswitch off"
	nordvpn set killswitch off
}

echo "Stopping nordvpn service"
systemctl is-active --quiet nordvpn.service && systemctl stop nordvpn.service
sleep 2

echo "Stopping nordvpnd service"
systemctl is-active --quiet nordvpnd.service && systemctl stop nordvpnd.service
sleep 2

echo "Flushing iptables"
iptables --flush
sleep 3

echo "Restarting nordvpnd"
systemctl is-active --quiet nordvpnd.service || systemctl start nordvpnd
sleep 2
echo "Restarting nordvpn"
systemctl is-active --quiet nordvpn.service || systemctl start nordvpn


echo "Flushing iptables again just to be safe"
iptables --flush
sleep 1

echo "$0 finished"
