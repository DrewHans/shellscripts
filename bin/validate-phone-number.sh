#!/usr/bin/env bash


# regexp to get a valid phone number

echo $1 | grep -qE '^(?:(?:\(?(?:00|\+)([1-4]\d\d|[1-9]\d?)\)?)?[\-\.\ \\\/]?)?((?:\(?\d{1,}\)?[\-\.\ \\\/]?){0,})(?:[\-\.\ \\\/]?(?:#|ext\.?|extension|x)[\-\.\ \\\/]?(\d+))?$'

if [ $? -eq 0 ]; then
	echo "$1 is a valid phone number."
else
	echo "$1 is an invalid phone number."
fi

echo "$0 finished"
