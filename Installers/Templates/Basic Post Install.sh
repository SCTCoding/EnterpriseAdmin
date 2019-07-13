#! /bin/bash

## Global Variables
install_dir=$(dirname $0)
## Assumes contents are in a folder.
foldername=""
pkgname=""

if [[ -d "$install_dir/$foldername" ]]
then
  /usr/sbin/installer -pkg "$install_dir"/"$foldername"/"$pkgname" -target /
else
  echo "File does not exist. Failing."
  exit 1
fi

exit 0
