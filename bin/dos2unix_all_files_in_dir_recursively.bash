#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

find ./ -type f -print0 | xargs -0 dos2unix --
