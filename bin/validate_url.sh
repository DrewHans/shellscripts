#!/usr/bin/env bash

# regexp to get a valid url

echo $1 | grep -qE '^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$'

if [ $? -eq 0 ]; then
    echo "$1 is a valid url."
else
    echo "$1 is an invalid url."
fi