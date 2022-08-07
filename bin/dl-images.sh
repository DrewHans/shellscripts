#!/usr/bin/env bash


if [ "$#" -ne 1 ]; then
	echo "Error: you must pass in a website url"
	exit 1
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
