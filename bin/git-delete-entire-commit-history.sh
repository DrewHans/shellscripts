#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

# safety checks
check_dependency "git"

echo "Starting $0"

# checkout a new orphan branch
git checkout --orphan latest_branch

# add all the files to orphan branch
git add -A

# commit the files
git commit -am "Reset git repo's commit history"

# delete the main / master branch
git branch -D main
git branch -D master

# rename the current (orphan) branch to main
git branch -m main

# force push the updated local repo to the remote repo
git push -f origin main

# cleanup unnecessary files & optimize the local repo
git gc --aggressive --prune=all

echo "$0 finished"
