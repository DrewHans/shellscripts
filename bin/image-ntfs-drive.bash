#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

src=/media/nyancat/MyNTFSDrive
dst=/media/nyancat/SomeDrive
creationtime=$(date +%Y.%m.%d.%H%M)

ntfsclone $src $dst/MyNTFSDrive.$creationtime.img

# Create an index file for faster grepping (especially on optical media discs [CD-Rs are super slow])
ls -R $dstdir/ >> $dst/MyNTFSDrive.$creationtime.img.index

# Search Example: grep -i 'search term' /media/nyancat/MyDriveBAK.index
