#!/usr/bin/env bash


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

echo "Finished"
