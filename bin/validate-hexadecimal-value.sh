#!/usr/bin/env bash


# regexp to get a valid hexadecimal value

echo $1 | grep -qE '^#?([a-f0-9]{6}|[a-f0-9]{3})$'

if [ $? -eq 0 ]; then
    echo "$1 is a valid hexadecimal number."
else
    echo "$1 is an invalid hexadecimal number."
fi