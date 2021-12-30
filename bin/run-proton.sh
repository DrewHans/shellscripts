#!/usr/bin/env bash


# declare env variables required by proton
STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.var/app/com.valvesoftware.Steam/.local/share/Steam/
STEAM_COMPAT_DATA_PATH=/mnt/gamedisk/steam/steamapps/compatdata

# set path to proton python script
PROTON=/mnt/gamedisk/steam/steamapps/common/Proton\ -\ Experimental/proton

# set path to windows game's exe
GAME_EXE=/mnt/gamedisk/freeware/GAMENAME/game.exe

# launch the game with proton
$PROTON run $GAME_EXE
