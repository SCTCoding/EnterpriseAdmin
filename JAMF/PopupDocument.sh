#! /bin/bash

######################################
# Simon Carlson-Thies | May 2019
# Popup Documentation
######################################

## Obtain username and uid
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

urltoopen="$4"

## Create local script
cat << EOD > /private/tmp/PopupDocumnent.sh

#! /bin/bash

open -a Safari "$urltoopen"

osascript <<END

tell application “Safari” to activate

END

exit 0

EOD

## Make script executable
/bin/chmod +x /private/tmp/PopupDocumnent.sh

## Run the script as logged in user

/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" "/private/tmp/PopupDocumnent.sh”

rm /private/tmp/PopupDocumnent.sh

exit 0
