#! /bin/bash

## User Identification
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

## Where is Policy Helper installed
helperpath="/Applications/Utilities"

## Write the name to the variable
name=$(defaults read /private/tmp/com.sctcoding.policyhelper.plist name)

## Start Policy Helper
/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" "$helperpath"/Policy\ Helper.app/Contents/MacOS/Policy\ Helper 2>1 & 

## Finsh script
wait $! && if [[ -f "/private/tmp/policyHelper_"$name".sh" ]]; then /private/tmp/policyHelper_"$name".sh; else exit 0; fi;

exit 0
