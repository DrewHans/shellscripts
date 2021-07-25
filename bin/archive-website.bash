#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

wget \
  --mirror \
  --page-requisites \
  --html-extension \
  --convert-links \
  --execute robots=off \
  --directory-prefix=. \
  --span-hosts \
  --user-agent=Mozilla \
  --wait=2 \
  --random-wait \
  --recursive \
  --no-parent \
  --level=1 \
  https://drewhans555.github.io