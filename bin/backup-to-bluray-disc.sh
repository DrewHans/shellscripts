#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

# safety checks
check_dependency "truncate"
check_dependency "mkudffs"  // install with sudo apt install udftools
check_dependency "growisofs"  // install with sudo apt install growisofs

# Step 1. Create UDF File
truncate --size=25GB ./mybr.udf
# use truncate; never use dd (takes too long); always use "GB" identifier, never "G"

# Step 2. Format the UDF File
mkudffs ./mybr.udf
# if you're storing thousands of small files, use blocksize argument 1024
# if you're storing huge files, use blocksize argument 4096
# if you need non-ascii characters in your filenames, there are unicode and utf-8 options

# Step 3. Mount the UDF file to make a UDF file system
sudo mount -oloop,rw ./mybr.udf /mnt/test
sudo chown nyancat:nyancat /mnt/test

# Step 4. Copy the material to be backed up to the UDF file system in whatever form you want
read -p "Copy your files to /mnt/test, then press any key to continue..."

# WARNING: When all your data copying is done, it is ABSOLUTELY VITAL that you unmount the UDF file.
#          That's what makes sure the data is actually written inside the UDF file, which is now an
#          image for your Blu-Ray recording.

# Step 5. Unmount the UDF file system in order to make sure everything's written
sudo umount /mnt/test

# Step 6. Record the UDF file onto a Blu-Ray disc
growisofs -speed=1 -Z /dev/dvd=./mybr.udf
# if your bluray media can perform at elevated speeds, use the higher speed
# otherwise, use a speed of 1
