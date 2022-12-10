#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

# safety checks
check_dependency "mkvpropedit"

echo "Start\n"

for f in *.mkv
do
	mkvpropedit -v "$f" \
	--edit track:a1 --set flag-default=0 \
	--edit track:a1 --set flag-forced=0 \
	--edit track:a2 --set flag-default=1 \
	--edit track:a2 --set flag-forced=0 \
	--edit track:s1 --set flag-default=0 \
	--edit track:s1 --set flag-forced=0 \
	--edit track:s2 --set flag-default=1 \
	--edit track:s2 --set flag-forced=0
	
	echo ""
done

echo "$0 finished"
