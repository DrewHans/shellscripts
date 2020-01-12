#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

srcdir=/media/nyancat/MyDrive/
dstdir=/media/nyancat/MyDriveBAK/

sudo cp -arux $srcdir $dstdir
# -a => archive -> preserves mode, ownership, and timestamps; symlinks are not dereferenced
# -r => recursive -> copy directories recursively
# -u => update -> copy only when a file is newer than the destination file or when the destination file is missing
# -x => one-file-system -> stay on this file system

# Note: use rsync when you want to minimize traffic on the wire; beware, rsync has a lot of overhead;
