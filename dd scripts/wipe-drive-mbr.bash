#!/usr/bin/env bash

echo "Drives available for MBR wiping:"
lsblk | grep /dev/

echo "Enter drive name (example: sda):"
read drive_name

umount /dev/$drive_name > /dev/null 2>&1

echo "Wiping Master Boot Record on $(drive_name)"
dd if=/dev/zero of=/dev/$drive_name bs=446 count=1
