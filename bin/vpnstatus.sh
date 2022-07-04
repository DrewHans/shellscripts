#!/usr/bin/env bash


vpnserver=$(cat /var/log/openvpn/connection.txt)

echo "Connected to $vpnserver"

cat /var/log/openvpn/status.txt
