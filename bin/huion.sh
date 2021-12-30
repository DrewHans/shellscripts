#!/usr/bin/env bash


# check prerequisite program xsetwacom is installed
command -v xsetwacom >/dev/null 2>&1 || {
    echo "xsetwacom program not found; aborting"
    exit 1
}

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
