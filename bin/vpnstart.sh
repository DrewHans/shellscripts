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
#vpnserver=( $(shuf -zen1 /etc/openvpn/ovpn_udp/us*) )
configfile=$( ls -f /etc/openvpn/ovpn_udp/us[0-9]* | shuf -n1 )

echo "Connecting to $configfile..."

openvpn \
--config $configfile \
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

chown nyancat:nyancat /var/log/openvpn/status.txt
cat /var/log/openvpn/status.txt

echo "Enabling on killswitch"
# TODO: figure out how to enable passive killswitch option
echo "Finished"
