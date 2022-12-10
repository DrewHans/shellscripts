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
check_dependency "openvpn"
check_is_root

# pick a random server in the us
#vpnserver=( $(shuf -zen1 /etc/openvpn/ovpn_udp/us*) )
vpnconfigfile=$( ls -f /etc/openvpn/ovpn_udp/us[0-9]* | shuf -n1 )
vpnserver=${vpnconfigfile#/etc/openvpn/ovpn_udp/}

echo "Connecting to $vpnserver..."

openvpn \
--config $vpnconfigfile \
--auth-user-pass /etc/openvpn/nordvpn_auth.txt \
--log /var/log/openvpn/log.txt \
--status /var/log/openvpn/status.txt 10 \
--daemon
# --config file => vpn configuration file
# --auth-user-pass file => file with vpn auth credentials
# --log file => openvpn execution log information
# --status file n => userfriendly openvpn status information (updated every n seconds)
# --daemon => run in the background

sleep 2
chown 1000:1000 /var/log/openvpn/status.txt
echo ""

touch /var/log/openvpn/connection.txt
echo "$vpnserver" > /var/log/openvpn/connection.txt
chown 1000:1000 /var/log/openvpn/connection.txt

echo "Enabling on killswitch"
# TODO: figure out how to enable passive killswitch option
echo ""

echo "$0 finished"
