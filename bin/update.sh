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

if command -v "apt" > /dev/null 2>&1
then
	apt update && apt upgrade --yes
else
	echo "apt is not installed; skipping 'apt update && apt upgrade --yes'"
fi

if command -v "flatpak" > /dev/null 2>&1
then
	sudo -u ${SUDO_USER} flatpak update --assumeyes
else
	echo "flatpak is not installed; skipping 'flatpak update --assumeyes'"
fi

if command -v "yt-dlp" > /dev/null 2>&1
then
	yt-dlp --update
else
	echo "yt-dlp is not installed; skipping 'yt-dlp --update'"
fi

echo "$0 finished"
