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

# Step 2: Checkout the branch that corresponds to your current firmware version
git checkout 42bf7a6
# note: 42bf7a6 => 2023-09-08_42bf7a6 firmware

# Step 3: Pull submodules and install dependencies
git submodule init
git submodule update
./scripts/deps.sh
source ~/.cargo/env
cd ec

# Step 3b: Optional: Customize the fan profile
# vim ./src/board/system76/lemp11/board.mk

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

# Step 4: Create config.mk file and place your laptop model inside
touch config.mk
echo "BOARD?=system76/lemp11" >> config.mk

# note config.mk should be at firmware-open/ec/config.mk

# Step 5: Test your build
make

# if you get no errors, go on to next step

# Step 6. Flash it to the laptop (make sure you are in firmware-open/ec, at 80% charge, and plugged in to power)
make flash_internal

# note: when flash finishes, the laptop will shutdown
