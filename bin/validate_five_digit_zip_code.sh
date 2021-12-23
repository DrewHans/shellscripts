#!/usr/bin/env bash

# regexp to get a valid US postal code
echo $1 | grep -qE '^[0-9]{5}(-[0-9]{4})?$'

if [ $? -eq 0 ]; then
    echo "$1 is a valid US postal code."
else
    echo "$1 is an invalid US postal code."
fi