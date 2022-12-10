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
	if [[ $EUID -eq 0 ]]; then
		echo "This script should not be run as root."
		exit 1
	fi
}

# safety checks
check_not_root
check_dependency "dos2unix"

# copy bin to HOME
cp -ru ./bin $HOME/
for f in $HOME/bin/*.*sh; do
	dos2unix $f
	chmod 744 $f
done

echo "$0 finished"
