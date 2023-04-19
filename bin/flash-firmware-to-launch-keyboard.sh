#!/usr/bin/env bash


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

echo "Cloning firmware git repo"
git clone https://github.com/system76/qmk_firmware.git

echo "Building tools needed to flash the firmware"
cd qmk_firmware
make git-submodule
./util/qmk_install.sh
sudo apt update
sudo apt install avrdude gcc-avr avr-libc

echo "Building the firmware"
make system76/launch_1:default

echo "Check firmware builds ok then press enter (if not ok, hit ctrl-c)"
read

echo "Beginning firmware flash"
echo ""
echo "Put you Launch into dfu mode when prompted:"
echo "- unplug the keyboard usb from the computer, next"
echo "- hold the ESC key while plugging it back in, then"
echo "- keep ESC held until the firmware flasher recognizes the Launch in DFU mode, lastly"
echo "- let go and don't press any keys"

make system76/launch_1:default:dfu
