#!/usr/bin/env bash


# check prerequisite program ntfsclone is installed
command -v ntfsclone >/dev/null 2>&1 || {
    echo "ntfsclone program not found; aborting"
    exit 1
}

src=/media/nyancat/MyNTFSDrive
dst=/media/nyancat/SomeDrive
creationtime=$(date +%Y.%m.%d.%H%M)

ntfsclone $src $dst/MyNTFSDrive.$creationtime.img

# Create an index file for faster grepping (especially on optical media discs [CD-Rs are super slow])
ls -R $dstdir/ >> $dst/MyNTFSDrive.$creationtime.img.index

# Search Example: grep -i 'search term' /media/nyancat/MyDriveBAK.index
