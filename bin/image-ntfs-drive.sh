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
check_dependency "ntfsclone"

src=/media/nyancat/MyNTFSDrive
dst=/media/nyancat/SomeDrive
creationtime=$(date +%Y.%m.%d.%H%M)

ntfsclone $src $dst/MyNTFSDrive.$creationtime.img

# Create an index file for faster grepping (especially on optical media discs [CD-Rs are super slow])
ls -R $dstdir/ >> $dst/MyNTFSDrive.$creationtime.img.index

# Search Example: grep -i 'search term' /media/nyancat/MyDriveBAK.index

echo "$0 finished"
