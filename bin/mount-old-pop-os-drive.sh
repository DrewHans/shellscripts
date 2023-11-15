#!/usr/bin/env bash


echo "Don't run this script; use these commands for future reference"
exit 1


# identify the drive & partition you want to extract data from with lsblk
lsblk

# open the encrypted partition and give it a unique name
sudo cryptsetup luksOpen /dev/nvme1n1p3 oldharddrive

# run vgdisplay and grab the partition's VG UUID
sudo vgdisplay

# now use vgrename to rename the volume group to something unique and easy to remember
sudo vgrename aa0aAA-BB2B-CCdD-EffG-HHij-k01l-MNO2p oldharddrivevol

# run lvscan and verify that /dev/oldharddrivevol/root is INACTIVE
sudo lvscan

# now activate it with vgchange
sudo vgchange -ay oldharddrivevol

# verify that /dev/oldharddrivevol/root is now ACTIVE
sudo lvscan

# now create a mount directory
sudo mkdir -p /media/nyancat/tmpmount

# and now finally we mount the partition
sudo mount /dev/oldharddrivevol/root /media/nyancat/tmpmount

# go grab the data you need

# unmount the partition
sudo umount /media/nyancat/tmpmount

# deactivate it
sudo vgchange -an oldharddrivevol

# finally, close the encrypted volume
sudo cryptsetup luksClose oldharddrive
