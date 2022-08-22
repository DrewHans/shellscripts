#!/usr/bin/env bash


# exit if running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: Do you must run this script as root"
    exit 1
fi

# needed to reload the v4l2loopback kernel module (it errors after first use)
modprobe -r v4l2loopback

# launch obs and start the virtual camera automatically (and redirect STDERR to /dev/null)
flatpak run com.obsproject.Studio --startvirtualcam 2>/dev/null

