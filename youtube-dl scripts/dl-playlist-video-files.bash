#!/usr/bin/env bash
#
# Author: Drew Hans (github.com/drewhans555)
# Date: 2019-01-11

usage() {
    local exitcode=0
    if [ $# != 0 ]; then
        echo "$@"
        exitcode=1
    fi
    echo "Usage: $0 <url_to_playlist>"
    echo 
    echo "  -h, --help    Print this help"
    echo
    echo "Using youtube-dl you can download a single video like so:"
    echo " \$ youtube-dl -o output.mp4 <url_to_video>"
    echo "If you want to download every video in a playlist, then"
    echo " you need to specify an output file pattern ( %(title)s.%(ext)s )"
    echo " so that youtube-dl will know to output each video stream "
    echo " to a different file."
    echo
    exit $exitcode
}

args=
while [ $# != 0 ]; do
    case $1 in
    -h|--help) usage ;;
    -) usage "Unknown option: $1" ;;
    -?*) usage "Unknown option: $1" ;;
    *) args="$args \"$1\"" ;;  # script that takes multiple arguments
    esac
    shift
done

eval "set -- $args"
test $# == 1 || usage "Error: specify a YouTube playlist url"

youtube-dl -o "%(title)s.%(ext)s" $1
