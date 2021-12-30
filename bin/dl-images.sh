#!/usr/bin/env bash


# check prerequisite program gallery-dl is installed
command -v gallery-dl >/dev/null 2>&1 || {
    echo "gallery-dl program not found; aborting"
    exit 1
}

start_index=1
end_index=99

for i in {$start_index..$end_index}; do
    url="https://some-website.com/g/some-path/$i"
    gallery-dl "r:$url";
done
