#!/usr/bin/env bash


# declare env variables required by proton
STEAM_COMPAT_CLIENT_INSTALL_PATH=$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/
STEAM_COMPAT_DATA_PATH=/mnt/gamedisk/steam/steamapps/compatdata

# set path to proton python script
PROTON=/mnt/gamedisk/steam/steamapps/common/Proton\ -\ Experimental/proton

# set path to windows game's exe
GAME_EXE=/mnt/gamedisk/freeware/GAMENAME/game.exe


if [ ! -f "$PROTON" ]
then
	echo "Proton script was not found at$PROTON"
	exit 1
fi

# launch the game with proton
$PROTON run $GAME_EXE

echo "$0 finished"
