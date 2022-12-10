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
check_dependency "xsetwacom"

# top left tablet button
xsetwacom --set 'HUION Huion Tablet_HS64 Pad pad' Button 1 "key +shift +ctrl +alt +f"

# bottom left tablet button
xsetwacom --set 'HUION Huion Tablet_HS64 Pad pad' Button 2 "key +shift +ctrl +alt +g"

# top right tablet button
xsetwacom --set 'HUION Huion Tablet_HS64 Pad pad' Button 3 "key +ctrl +alt +r"

# bottom right tablet button
#xsetwacom --set 'HUION Huion Tablet_HS64 Pad pad' Button 4 ""

# stylus pen tip
# xsetwacom --set 'HUION Huion Tablet_HS64 stylus' Button 1 ""

# stylus bottom rocker
xsetwacom --set 'HUION Huion Tablet_HS64 stylus' Button 2 "key +ctrl +"

# stylus top rocker
xsetwacom --set 'HUION Huion Tablet_HS64 stylus' Button 3 "key +ctrl -"

echo "$0 finished"
