#!/usr/bin/env bash

# regexp to get a valid email address

echo $1 | grep -qE '^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$'

if [ $? -eq 0 ]; then
    echo "$1 is a valid email address."
else
    echo "$1 is an invalid email address."
fi