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
check_dependency "veracrypt"
check_is_root

veracrypt_volume=$1
dir_path=$2
password=$3

veracrypt \
  --text \
  --mount $veracrypt_volume $dir_path \
  --password $password \
  --pim 0 \
  --keyfiles "" \
  --protect-hidden no \
  --verbose

# --text => use VeraCrypt in text mode (not gui mode)
# --mount <veracrypt_volume> <dir_path> => mounts <veracrypt_volume> to <dir_path>
# --password <pw> => the decryption password (pass as a param)
# --pim 0 => the pim you used when creating the volume (0 is default)
# --keyfiles "" => the keyfile location, if the volume needs it (otherwise pass empty string)
# --protect-hidden no => pass yes if volume has a hidden partition, else pass no
# --verbose => use this option when debugging, else omit it

echo "$0 finished"
