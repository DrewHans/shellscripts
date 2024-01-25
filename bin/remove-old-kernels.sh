#!/usr/bin/env bash


function check_is_root {
	if [[ $EUID -ne 0 ]]
	then
		echo "This script must be run as root."
		exit 1
	fi
}

# safety checks
check_is_root

# remove old kernels on Debian
if command -v "apt" > /dev/null 2>&1
then
	apt autoremove --purge --yes
	# will automatically identify which kernels can be removed without damaging
	# any currently installed packages
else
	echo "apt is not installed, skipping"
fi

# remove old kernels on Fedora
if command -v "dnf" > /dev/null 2>&1
then
	old_kernels=($(dnf repoquery --installonly --latest-limit=-1 -q))

	if [ "${#old_kernels[@]}" -eq 0 ]; then
		echo "No old kernels found"
		exit 0
	fi

	if ! dnf remove "${old_kernels[@]}"; then
		echo "Failed to remove old kernels"
		exit 1
	fi

	echo "Removed old kernels on Fedora"

	exit 0
else
	echo "dnf is not installed, skipping"
fi


echo "$0 finished"
