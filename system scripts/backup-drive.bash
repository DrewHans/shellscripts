#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

srcdir=/media/nyancat/MyDrive
dstdir=/media/nyancat/MyDriveBAK

cp -arux $srcdir $dstdir
# -a => archive -> preserves mode, ownership, and timestamps; symlinks are not dereferenced
# -r => recursive -> copy directories recursively
# -u => update -> copy only when a file is newer than the destination file or when the destination file is missing
# -x => one-file-system -> stay on $srcdir's file system

# Note: use rsync when you want to update an existing backup and/or minimize traffic on the wire;
#       beware, rsync has a lot of overhead and is several times slower than cp (at least 2x slower in my experience);

# Create an index file for faster grepping (especially on optical media discs [CD-Rs are super slow])
ls -R $dstdir/ >> $dstdir/MyDriveBAK.index

# Search Example: grep -i 'search term' /media/nyancat/MyDriveBAK.index
