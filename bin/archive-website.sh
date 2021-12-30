#!/usr/bin/env bash


if [[ $# -ne 1 ]]; then
    echo "Error: specify a website url"
    echo "Usage: $0 <website_url>"
    exit 1
fi

website_url=$1

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
  $website_url
