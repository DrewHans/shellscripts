#!/usr/bin/env bash


vpnserver=$(cat /var/log/openvpn/connection.txt)

echo "$vpnserver"
echo ""
cat /var/log/openvpn/status.txt
