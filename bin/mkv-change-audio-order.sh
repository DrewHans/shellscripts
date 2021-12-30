#!/usr/bin/env bash


# check prerequisite program mkvpropedit is installed
command -v mkvpropedit >/dev/null 2>&1 || {
    echo "mkvpropedit program not found; aborting"
    exit 1
}

echo "Start\n"

for f in *.mkv
do
    mkvpropedit -v "$f" \
    --edit track:a1 --set flag-default=0 \
    --edit track:a1 --set flag-forced=0 \
    --edit track:a2 --set flag-default=1 \
    --edit track:a2 --set flag-forced=0 \
    --edit track:s1 --set flag-default=0 \
    --edit track:s1 --set flag-forced=0 \
    --edit track:s2 --set flag-default=1 \
    --edit track:s2 --set flag-forced=0
    
    echo ""
done

echo "End"

