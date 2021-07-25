#!/usr/bin/env bash
#
# Author: Drew Hans (github.com/drewhans555)

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
    echo "This shellscript prints each entry in PATH on a new line"
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

echo "${PATH//:/$'\n'}"
echo
