#!/usr/bin/env bash


echo "Don't run me"

# download Windows 10 ISO from here:
# https://www.microsoft.com/en-us/software-download/windows10ISO

# install wimtools for compressing install.wim:
# sudo apt install wimtools --yes"

# mount the windows 10 iso with disk-image-mounter

# open the folder containing the windows 10 files

# copy all the files to your local disk

# unmount the windows 10 iso

# go into your local copy, and open sources

# run this command on install.wim:
# wimlib-imagex optimize install.wim --solid\

# now wait for it to compress install.wim to a size that will fit on a fat32 drive

# insert a new flashdrive, format it to fat32, and then copy all the files over to it

# you're done; now you can install windows 10 to a new laptop
# note: you may see a blinking cursor for 10 - 20 minutes while the windows 10 installer ui loads
