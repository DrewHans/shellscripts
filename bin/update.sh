#!/usr/bin/env bash


sudo apt update && sudo apt upgrade --yes

sudo -u ${SUDO_USER} flatpak update --assumeyes

sudo yt-dlp --update
