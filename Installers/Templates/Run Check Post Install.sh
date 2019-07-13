#! /bin/bash

## Global Variables
install_dir=$(dirname $0)
## Assumes contents are in a folder.
foldername=""
pkgname=""
procname=""
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

if [[ -d "$install_dir/$foldername" ]]
then
  if [[ $(ps -Ac | grep -c "$procname") -eq 0 ]]
  then
    /usr/sbin/installer -pkg "$install_dir"/"$foldername"/"$pkgname" -target /
  else
    echo "Process $procname is running. Failing."
    ## User visible popup.
    /bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'display dialog "Alert: process \"$procname\" is currently running. Please quit and try again." buttons {"Dismiss"} with icon Caution'
    exit 1
  fi
else
  echo "File does not exist. Failing."
  exit 1
fi

exit 0


