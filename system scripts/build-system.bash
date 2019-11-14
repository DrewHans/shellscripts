#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)
# Date (last modified): 2019-11-13



tmpdir=.build-system.bash.tmpdir
logfile=.build-system.bash.log



log_operation() {
    if [ $# != 2 ]; then
        echo "Error: function log_operation requires 2 args"
        echo "$# args passed: $@"
        echo "Check $0 for bugs"
        exit 1
    fi

    operation=$1
    result=$2
    
    echo "$operation returned $result (0 indicates success).\n" | tee ../$logfile
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
mkdir $tmpdir
cd $tmpdir



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
brasero \
chromium-browser \
clementine \
conky \
curl \
dconf-editor \
dos2unix \
ffmpegthumbnailer \
ghex \
gimp \
git \
gnome-tweak-tool \
gnupg2 \
gparted \
gufw \
handbrake \
htop \
inkscape \
keepass2 \
keepassxc \
mediainfo \
mkvtoolnix mkvtoolnix-gui \
nemo \
neofetch \
nmap \
qbittorrent \
sleuthkit \
sublime-text \
vim \
virtualbox-6.0 \
--yes

log_operation "apt install <packages>" $?



echo "Installing snap packages"
echo

snap install \
vlc

log_operation "snap install <packages>" $?



echo "Downloading Calibre installer (installer will run after download)"
echo
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin
log_operation "Calibre install" $?

echo "Installing youtube-dl"
echo
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
log_operation "youtube-dl install" $?
chmod a+rx /usr/local/bin/youtube-dl
echo "Updating youtube-dl to most recent version"
youtube-dl --update
log_operation "youtube-dl update" $?
echo



echo "Installing Ubuntu-Drivers (usually just NVIDIA drivers)"
echo
ubuntu-drivers autoinstall
log_operation "ubuntu-drivers autoinstall" $?



echo "Cleaning up install files"
cd ..
rm -r ./$tmpdir
echo "... clean up finished."
echo



echo "Visit the following links and manually download the appropriate .deb & run files:"
echo "- BleachBit: https://www.bleachbit.org/"
echo "- Dropbox: https://www.dropbox.com/"
echo "- Keybase: https://keybase.io/"
echo "- NordVPN: https://nordvpn.com/"
echo "- Tor: https://www.torproject.org/"
echo "- Veracrypt: https://veracrypt.fr/en/"
echo "- VS Code: https://code.visualstudio.com/"
echo



echo "rebuildsystem.bash complete!"
echo 

exit 0
