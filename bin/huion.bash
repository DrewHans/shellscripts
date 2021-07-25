#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

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
