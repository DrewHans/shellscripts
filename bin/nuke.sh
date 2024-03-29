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
nuke_file $HOME/.bash_history

# destroy brave browser cache if it exists
nuke_directory $HOME/.cache/BraveSoftware

# destroy firefox cache if it exists
nuke_directory $HOME/.cache/mozilla/firefox

# destroy keepassxc cache if it exists
nuke_directory $HOME/.cache/keepassxc

# destroy qbittorrent cache if it exists
nuke_directory $HOME/.cache/qBittorrent

# destroy thumbnail cache if it exists
nuke_directory $HOME/.cache/thumbnails

echo "$0 finished"
