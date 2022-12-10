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
check_dependency "rename"

if [[ $# -ne 2 ]]
then
	echo "Error: you must provide a search_str and a replace_str"
	echo "Usage: $0 <search_str> <replace_str>"
	exit 3
fi

search_str=$1
replace_str=$2

rename "s/$search_str/$replace_str/g" *
# this will replace the string search_str with replace_str in every filename

# /g => global: SEARCH_SEARCH.jpg will be renamed REPLACE_REPLACE.jpg
# leave off /g if you only want one substitution
# add /i at the end for case-insensitive (rename "s/$search_str/$replace_str/g" *)

echo "$0 finished"
