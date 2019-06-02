#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)
# Date: 2019-06-02

print_install_result() {
    if [ $# != 2 ]; then
        echo "Error: function print_install_result requires 2 args"
        echo "$# args passed: $@"
        exit 1
    fi

    operation=$1
    result=$2
    echo
    if [ $result -eq 0 ]; then
        echo "$operation succeeded!"

    else
        echo "$operation returned $result (0 indicates success)."
        read -p "Press enter to continue..."
    fi
    echo
}

usage() {
    local exitcode=0
    if [ $# != 0 ]; then
        echo "$@"
        exitcode=1
    fi
    echo "Usage: sudo $0"
    echo 
    echo "  -h, --help    Print this help"
    echo
    echo "Run this script on a fresh Ubuntu 18.04 install."
    echo "This script will install:"
    echo " git, SublimeText"
    echo
    exit $exitcode
}

args=
while [ $# != 0 ]; do
    case $1 in
    -h|--help) usage ;;
    -) usage "Unknown option: $1" ;;
    -?*) usage "Unknown option: $1" ;;
    *) args="$args \"$1\"" ;;  # script that takes multiple arguments
    esac
    shift
done

eval "set -- $args"
test $# == 0 || usage "Error: unexpected argument: $1"
test "$EUID" -eq 0 || usage "Error: please run as root"

echo "Starting $0"
mkdir rebuildsystem-temp
cd rebuildsystem-temp

echo "Adding Audacity PPA"
echo
add-apt-repository ppa:ubuntuhandbook1/audacity
echo

echo "Adding balenaEtcher PPA & Keys"
echo
echo "deb https://deb.etcher.io stable etcher" | tee /etc/apt/sources.list.d/balena-etcher.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
echo

echo "Adding GIMP PPA"
echo
add-apt-repository ppa:otto-kesselgulasch/gimp
echo

echo "Adding git PPA"
echo
add-apt-repository ppa:git-core/ppa
echo

echo "Adding Inkscape PPA"
echo
add-apt-repository ppa:inkscape.dev/stable
echo

echo "Adding mkvtoolnix gpg key & PPA"
echo
wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add -
echo "deb https://mkvtoolnix.download/ubuntu/ bionic main" | tee /etc/apt/sources.list.d/mkvtoolnix.download.list
echo "deb-src https://mkvtoolnix.download/ubuntu/ bionic main" | tee -a /etc/apt/sources.list.d/mkvtoolnix.download.list
echo

echo "Adding neofetch PPA"
echo
add-apt-repository ppa:dawidd0811/neofetch
echo

echo "Adding qBittorrent PPA"
echo
add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
echo

echo "Adding SublimeText gpg key & PPA"
echo
wget -q -O - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
echo

echo "Performing apt update"
echo
apt update
echo

echo "Installing apt packages"
echo

apt install \
audacity \
balena-etcher-electron \
chromium-browser \
clementine \
conky \
dconf-editor \
dos2unix \
ffmpegthumbnailer \
gimp \
git \
gnome-tweak-tool \
gparted \
handbrake \
htop \
inkscape \
keepass2 \
mkvtoolnix mkvtoolnix-gui \
nemo \
neofetch \
nmap \
qbittorrent \
sleuthkit \
sublime-text \
vim \
--yes

print_install_result "apt install <packages>" $?

echo "Installing snap packages"
echo
snap install vlc
print_install_result "snap install <packages>" $?

echo "Downloading Calibre installer (installer will run after download)"
echo
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin
print_install_result "Calibre install" $?

echo "Installing Ubuntu-Drivers (usually just NVIDIA drivers)"
echo
ubuntu-drivers autoinstall
print_install_result "Ubuntu-Driver install" $?

echo "Cleaning up install files"
cd ..
rm -r ./rebuildsystem-temp
echo "... clean up finished."
echo

echo "Visit the following links and manually download the appropriate .deb file:"
echo "- BleachBit: https://www.bleachbit.org/"
echo "- Dropbox: https://www.dropbox.com/"
echo "- Keybase: https://keybase.io/"
echo "- VS Code: https://code.visualstudio.com/"
echo
echo "rebuildsystem.bash complete!"
echo 

exit 0
