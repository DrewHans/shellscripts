#!/usr/bin/env bash


# exit if not running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: You must run this script as root"
    exit 1
fi

# first ensure that you have the correct device path (replace /dev/sXX as necessary)
sudo chown -hR nyancat /dev/sXX

echo "Now remove the micro sd card and reinsert it"
echo "After it mounts, it should not be \"readonly\" anymore"
