#!/usr/bin/env bash

# exit if not running as root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Error: You must run this script as root"
    exit 1
fi

echo "Starting $0"

src_path="/media/veracrypt1"  # should be master drive
dest_path="/media/veracrypt2"  # should be backup drive

echo "Regenerating master.index file"

ls -R $src_path > $src_path/master.index

echo "Starting rsync"

sudo rsync -r -t -x -v --progress --delete -i -s $src_path/ $dest_path | tee -a /tmp/rsync_output.log
# rsync options:
#  -r => recurse into directories
#  -t => preserve modification times
#  -x => don't cross filesystem boundaries
#  -v => increases verbosity
#  --progress => show progress during tansfer
#  -i => output a change-summary for all updates
#  -s => no space-splitting; wildcard chars only

echo "$0 finished"
