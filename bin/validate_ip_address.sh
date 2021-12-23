#!/usr/bin/env bash

# regexp to get a valid ip address

echo $1 | grep -qE '^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'

if [ $? -eq 0 ]; then
    echo "$1 is a valid ip address."
else
    echo "$1 is an invalid ip address."
fi