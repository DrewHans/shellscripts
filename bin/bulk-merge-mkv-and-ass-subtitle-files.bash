#!/usr/bin/env bash
#
# Author: Drew Hans (github.com/drewhans555)
# Date: 2019-05-19

usage() {
    local exitcode=0
    if [ $# != 0 ]; then
        echo "$@"
        exitcode=1
    fi
    echo "Usage: $0"
    echo 
    echo "  -h, --help    Print this help"
    echo
    echo "Using mkvtoolnix you can combine video and subtitle files like so:"
    echo " \$ mkvmerge -o output.mkv input.mkv subs.srt "
    echo "Assuming your .mkv and .ass files share the same name, we can use"
    echo " a for loop to iterate this command over them all simply by"
    echo " replacing the .mkv extension with .ass in the third argument."
    echo " This script will bulk merge all .ass subtitle files to their"
    echo " appropriate .mkv containers and output the new mkv files in a"
    echo " directory called muxed."
    echo
    exit $exitcode
}

while [ $# != 0 ]; do
    case $1 in
    -h|--help) usage ;;
    -) usage "Unknown option: $1" ;;
    -?*) usage "Unknown option: $1" ;;
    esac
    shift
done

for f in *.mkv
do
	mkvmerge -o "./muxed/$f" "$f" "${f%.mkv}.ass"
done
