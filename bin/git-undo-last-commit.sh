#!/usr/bin/env bash


echo "Starting $0"

echo "Current commit history:"
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all -4
echo ""

echo "Resetting HEAD~"
git reset HEAD~

read -p "Now edit files in the local repo as necessary, then press any key to continue..."

echo "Adding files..."
git add .
echo ""

echo "Committing to ORIG_HEAD..."
git commit -c ORIG_HEAD
echo ""

echo "New commit history:"
git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all -4
echo ""

read -p "If everything looks good, press any key to continue..."

echo "Force pushing new commit history to remote repo..."
git push --force
echo ""

echo "Finished"
