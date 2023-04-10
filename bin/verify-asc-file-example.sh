#!/usr/bin/env bash


echo "Dont' run this script"

# example: verify the mullvad browser

# Step 1: download the signing key (from the trusted source [check sha sums if they exist!])
# $ gpg --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org

# Step 2: tell your system to trust the signing key (optional, but you should)

# - step 2a: tell gpg we want to edit the signing key
# $ gpg --edit-key EF6E286DDA85EA2A4BA7DE684E2C6E8793298290

# - step 2b: tell gpg to trust the key
# gpg> trust

# - step 2c: asign a trust level (we use 5 here for ultimate trust)
# Your decision? 5

# - step 2d: exit gpg
# gpg> q

# Step 3: download the Mullvad Browser

# Step 4: do the actual verification
# $ gpg --verify mullvad-browser-*.asc
# you should see something like "Good signature from ..."

