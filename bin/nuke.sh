#!/usr/bin/env bash

# destroy bash history
rm ~/.bash_history

# destroy brave browser cache
rm -r ~/.cache/BraveSoftware

# destroy keepassxc cache
rm -r ~/.cache/keepassxc

# destroy qbittorrent cache
rm -r ~/.cache/qBittorrent

# destroy thumbnail cache
rm -r ~/.cache/thumbnails

echo "nuked"
