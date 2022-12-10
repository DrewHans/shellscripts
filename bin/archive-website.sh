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
check_dependency "wget"

if [[ $# -ne 1 ]]
then
	echo "Error: specify a website url"
	echo "Usage: $0 <website_url>"
	exit 3
fi

website_url=$1

wget \
  --mirror \
  --page-requisites \
  --html-extension \
  --convert-links \
  --execute robots=off \
  --directory-prefix=. \
  --span-hosts \
  --user-agent=Mozilla \
  --wait=2 \
  --random-wait \
  --recursive \
  --no-parent \
  --level=1 \
  $website_url

echo "$0 finished"
