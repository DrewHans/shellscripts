#!/usr/bin/env bash


echo "Don't run this script"
exit 1

# use this command when ssh'd into archer
opkg list-upgradable | cut -f 1 -d ' ' | xargs -r opkg upgrade  
