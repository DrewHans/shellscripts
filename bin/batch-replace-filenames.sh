#!/usr/bin/env bash


if [[ $# -ne 2 ]]; then
    echo "Error: specify a search_str and replace_str"
    echo "Usage: $0 <search_str> <replace_str>"
    exit 1
fi

# check prerequisite program rename is installed
command -v rename >/dev/null 2>&1 || {
    echo "rename program not found; aborting"
    exit 1
}

search_str=$1
replace_str=$2

rename "s/$search_str/$replace_str/g" *
# this will replace the string search_str with replace_str in every filename

# /g => global: SEARCH_SEARCH.jpg will be renamed REPLACE_REPLACE.jpg
# leave off /g if you only want one substitution
# add /i at the end for case-insensitive (rename "s/$search_str/$replace_str/g" *)
