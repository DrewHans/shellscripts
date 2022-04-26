# run this in an adb shell
pm list packages | sed -e 's/.*=//' | sort
