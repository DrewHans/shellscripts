# run this in an adb shell
pm list packages -f -3 | sed -e 's/.*=//' | sort
