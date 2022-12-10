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

if [ "$#" -ne 1 ]
then
	echo "Error: you must provide a website url"
	echo "Usage: $0 <website_url>"
	exit 3
fi

website_url="$1"
save_location="images"

wget \
	--level=1 \
	--no-directories \
	--recursive \
	--directory-prefix=$save_location \
	--accept "*.jpg, *.jpeg, *.png, *.webp" \
	$website_url
# --level=1 => only look at the first subdirectory (the page with the images)
# --no-directories => do not create a hierarchy of directories when retrieving recursively
# --recursive => turn on recursive retrieving
# --directory-prefix=images => the directory where all downloaded files will be saved
# --accept "*.jpg, *.jpeg, *.png" => accept only files with these extensions

echo "$0 finished"
