#!/usr/bin/env bash


# regexp to get a valid credit card number

echo $1 | grep -qE '^([0-9]{4}[- ]?){3}[0-9]{4}$'

if [ $? -eq 0 ]; then
	echo "$1 is a valid credit card number."
else
	echo "$1 is an invalid credit card number."
fi

echo "$0 finished"
