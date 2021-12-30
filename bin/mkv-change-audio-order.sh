#!/usr/bin/env bash

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

