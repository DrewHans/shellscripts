#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

srcdir=/media/nyancat/MyDrive
dstdir=/media/nyancat/MyDriveBAK

rsync -alxH --delete --delete-during --quiet $srcdir $dstdir
# -a => archive -> preserves mode, ownership, and timestamps; symlinks are not dereferenced
# -l => links -> copy symlinks as symlinks
# -r => recursive -> copy directories recursively
# -x => one-file-system -> stay on $srcdir's file system
# -H => hard-links -> preserve hard links
# --delete => delete extraneous files from $dstdir
# --delete-during -> receiver deletes during the transfer
# --quiet -> suppress non-error messages

# Create an index file for faster grepping (especially on optical media discs [CD-Rs are super slow])
ls -R $dstdir/ >> $dstdir/MyDriveBAK.index

# Search Example: grep -i 'search term' /media/nyancat/MyDriveBAK.index
