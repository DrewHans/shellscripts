#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

srcdir=/media/nyancat/MyDrive
dstdir=/media/nyancat/MyDriveBAK

rsync -aruv $srcdir $dstdir
# -a => archive -> preserves mode, ownership, and timestamps
# -r => recursive -> copy directories recursively
# -u => update -> copy only when a file is newer than the destination file or when the destination file is missing
# -v => verbose -> show details of ongoing operations; useful to see what's being sync'd to the existing backup

# Update index file
ls -R $dstdir/ >> $dstdir/MyDriveBAK.index
