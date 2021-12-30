#!/usr/bin/env bash


# check prerequisite program veracrypt is installed
command -v veracrypt >/dev/null 2>&1 || {
    echo "veracrypt program not found; aborting"
    exit 1
}


veracrypt_volume=$1
dir_path=$2
password=$3

sudo veracrypt \
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
