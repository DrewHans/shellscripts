#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

function check_not_root {
	if [[ $EUID -eq 0 ]]
	then
		echo "This script should not be run as root."
		exit 1
	fi
}

# safety checks
check_not_root
check_dependency "rsync"

echo "Starting $0"

src_path="/media/veracrypt1"  # should be master drive
dest_path="/media/veracrypt2"  # should be backup drive
log_path="/home/nyancat"  # should be user's home dir

if [[ ! -d "$src_path" ]]
then
	echo "$src_path directory not found; aborting"
	exit 1
fi

if [[ ! -d "$dest_path" ]]
then
	echo "$dest_path directory not found; aborting"
	exit 1
fi

echo "Regenerating master.index file"

ls -R $src_path > $src_path/master.index

echo "Starting rsync (check $log_path for log output)"

rsync -r -t -x -v --progress --delete -i -s $src_path/ $dest_path | tee -a $log_path/rsync_output.log
# rsync options:
#  -r => recurse into directories
#  -t => preserve modification times
#  -x => don't cross filesystem boundaries
#  -v => increases verbosity
#  --progress => show progress during tansfer
#  --delete => delete extraneous files from dest dirs
#  -i => output a change-summary for all updates
#  -s => no space-splitting; wildcard chars only

echo "$0 finished"
