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
check_dependency "ia"

if [[ $# -ne 1 ]]; then
	echo "Error: you must provide an InternetArchive collection name"
	echo "Usage: $0 <collection_name>"
	echo "Example: $0 2dartistmagazine"
	exit 3
fi

collection_name=$1

ia download --search "collection:$collection_name" --glob="*.pdf"
# download => download one or more items from InternetArchive
# --search => will only download specified item or items
# --glob => will only download specific files matching the glob pattern

echo "$0 finished"
