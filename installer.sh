#!/usr/bin/env bash

# exit if running as root
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Do not run this script as root"
    exit
fi

# exit if dos2unix is not installed
command -v dos2unix >/dev/null 2>&1 || {
    echo >&2 "dos2unix is not installed; aborting installer.";
    exit 1;
}

# copy bin to HOME
cp -ru ./bin ~/
rm ~/bin/README.md
for f in ~/bin/*.*sh; do
    dos2unix $f
    chmod 744 $f
done

echo "shellscripts installed"

exit
