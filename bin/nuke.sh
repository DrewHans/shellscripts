#!/usr/bin/env bash


function nuke_file() {
    ## rm if file exists
    [[ -f $1 ]] && rm $1
}

function nuke_directory() {
    ## rm if dir exists
    [[ -d $1 ]] && rm -r $1
}

# destroy bash history if it exists
nuke_file ~/.bash_history

# destroy brave browser cache if it exists
nuke_directory ~/.cache/BraveSoftware

# destroy keepassxc cache if it exists
nuke_directory ~/.cache/keepassxc

# destroy qbittorrent cache if it exists
nuke_directory ~/.cache/qBittorrent

# destroy thumbnail cache if it exists
nuke_directory ~/.cache/thumbnails

echo "nuked"
