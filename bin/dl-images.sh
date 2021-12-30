#!/usr/bin/env bash


start_index=1
end_index=99

for i in {$start_index..$end_index}; do
    url="https://some-website.com/g/some-path/$i"
    gallery-dl "r:$url";
done
