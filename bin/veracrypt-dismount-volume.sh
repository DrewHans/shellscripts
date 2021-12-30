#!/usr/bin/env bash


# check prerequisite program veracrypt is installed
command -v veracrypt >/dev/null 2>&1 || {
    echo "veracrypt program not found; aborting"
    exit 1
}


mounted_volume=$1

sudo veracrypt --text --dismount $mounted_volume

# --text => use VeraCrypt in text mode (not gui mode)
# --dismount <mounted_volume> => attempt to dismount <mounted_volume>

# Note: <mounted_volume> can be one of the following:
#    1) Path to the encrypted VeraCrypt volume (I recommend this one; safest)
#    2) Mount directory of the volume's filesystem (if mounted)
#    3) Slot number of the mounted volume (requires --slot <slot_num>)
