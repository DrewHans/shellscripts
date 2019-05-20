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
    echo "Using youtube-dl you can download the audio from a single"
    echo " video like so:"
    echo " \$ youtube-dl -f 140 -o output.m4a <url_to_video>"
    echo "Assuming that you want an audio file for each video in the"
    echo " playlist, all we have to do is specify an output file"
    echo " pattern ( %(title)s.%(ext)s ) and youtube-dl will know to"
    echo " output each audio stream to a different file."
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

youtube-dl -f 140 -o "%(title)s.%(ext)s" $1
