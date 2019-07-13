#! /bin/bash

## Global Variables
install_dir=$(dirname $0)
## Assumes contents are in a folder.
foldername=""

if [[ -d "$install_dir/$foldername" ]]
then
  t
else
  echo "File does not exist. Failing."
  exit 1
fi

exit 0
