#!/usr/bin/env bash


function check_dependency {
	if ! command -v "$1" > /dev/null 2>&1
	then
		echo "This script requires $1 to be installed."
		echo "Please use your distribution's package manager to install it."
		exit 2
	fi
}

function check_not_root {
	if [[ $EUID -eq 0 ]]; then
		echo "This script should not be run as root."
		exit 1
	fi
}

function launch_resize_and_move_apps {
	# launch, size, & move easyeffects flatpak app to preferred location
	flatpak run com.github.wwmm.easyeffects > /dev/null 2>&1 & disown
	sleep 1
	EE_WINDOW_ID=$(xdotool search --onlyvisible --name "Easy Effects")
	if [[ -n "$EE_WINDOW_ID" ]]
	then
		xdotool windowsize $EE_WINDOW_ID 1190 621
		xdotool windowmove $EE_WINDOW_ID 3791 -55
	else
		echo "$0 failed to get easyeffects window id"
	fi

	# launch, size, & move ivpn app to preferred location
	/opt/ivpn/ui/bin/ivpn-ui > /dev/null 2>&1 & disown
	sleep 1
	IVPN_WINDOW_ID=$(xdotool search --onlyvisible --name ivpn)
	if [[ -n "$IVPN_WINDOW_ID" ]]
	then
		xdotool windowsize $IVPN_WINDOW_ID 320 600
		xdotool windowmove $IVPN_WINDOW_ID 4595 512
	else
		echo "$0 failed to get ivpn-ui window id"
	fi

	# launch, size, & move keepassxc flatpak app to preferred location
	flatpak run org.keepassxc.KeePassXC > /dev/null 2>&1 & disown
	sleep 1
	KPXC_WINDOW_ID=$(xdotool search --onlyvisible --name KeePassXC)
	if [[ -n "$KPXC_WINDOW_ID" ]]
	then
		xdotool windowsize $KPXC_WINDOW_ID 1065 686
		xdotool windowmove $KPXC_WINDOW_ID 3874 1213
	else
		echo "$0 failed to get keepassxc window id"
	fi

	# launch, size, & move terminal to preferred location
	gnome-terminal
	sleep 1
	TERMINAL_WINDOW_ID=$(xdotool search --onlyvisible --name "$USER@$HOSTNAME")
	if [[ -n "$TERMINAL_WINDOW_ID" ]]
	then
		xdotool windowsize $TERMINAL_WINDOW_ID 795 661
		xdotool windowmove $TERMINAL_WINDOW_ID 3822 485
	else
		echo "$0 failed to get gnome-terminal window id"
	fi

	# note: '> /dev/null 2>&1' throws away the command output
	# note: '& disown' runs command in the background & detaches it from the shell
}

# safety checks
check_not_root
check_dependency "xdotool"

for n in $(seq 1 6)
do
	sleep 10
	NUM_MONITORS=$(xrandr --query | grep " connected" | wc -l)

	# verify all three monitors are detected by system
	if [ $NUM_MONITORS -ge 3 ]
	then
	    sleep 15
		launch_resize_and_move_apps
		break
	fi
done

echo "$0 finished"
