#!/usr/bin/env bash


echo "Don't run this script! Treat this file as documentation."
exit 1


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

function check_is_root {
	if [[ $EUID -ne 0 ]]
	then
		echo "This script must be run as root."
		exit 1
	fi
}

# safety checks
check_dependency "git"
check_dependency "make"
check_is_root

# Step 0: Install prerequisite software
# Install rustc / cargo / rustup via https://sh.rustup.rs

# Step 1: Clone the firmware repo
git clone https://github.com/system76/firmware-open.git
cd firmware-open

# Step 2: Checkout the branch that corresponds to the firmware version you want
git checkout 42bf7a6
# note: 42bf7a6 => 2023-09-08_42bf7a6 firmware version

# Step 3a: Pull submodules and install dependencies
git submodule update --init --recursive
./scripts/deps.sh
source ~/.cargo/env

# OPTIONAL Step 3b: Customize the fan profile
gedit ./ec/src/board/system76/lemp11/board.mk

# Add these lines to set fan points
# Note: (FAN_POINT(60, 40) means ‘If over 60 celsius for 5 seconds, turn fan to 40% speed‘.)
: '
# Set custom fan curve
CFLAGS+=\
	-DBOARD_HEATUP=5 \
	-DBOARD_COOLDOWN=20 \
	-DBOARD_FAN_POINTS="\
		FAN_POINT(60, 20), \
		FAN_POINT(70, 40), \
		FAN_POINT(75, 50), \
		FAN_POINT(80, 60), \
		FAN_POINT(85, 70), \
		FAN_POINT(90, 80), \
		FAN_POINT(95, 90)"
'
# note: the CFLAGS variable should be defined before including system76 common code line at bottom

# OPTIONAL Step 3c: Create config.mk file and place your laptop model inside (required if step 3b)
touch ./ec/config.mk
echo "BOARD?=system76/lemp11" >> ./ec/config.mk

# OPTIONAL Step 3d: Test your build (required if step 3c)
cd ec
make
cd ..

# if you get no errors, go on to next step

# Step 4: Build the new custom firmware
./scripts/build.sh lemp11

# if you get no errors, go on to next step

# Step 5: Flash it to the laptop (make sure you are at 80% charge and plugged in to power)
./scripts/flash.sh lemp11

# note: the flash.sh script last worked with the 2022-11 firmware update; every
#       version of flash.sh after has not worked properly; if you can't get it
#       to flash the new firmware image to the laptop, try using the old version
#       of flash.sh instead. I had no problems flashing the two 2023 firmware
#       and ec roms with the old version of flash.sh.

# Step 6: Reboot
sudo systemctl reboot
