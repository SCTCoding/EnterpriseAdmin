#! /bin/bash

## Obtain username and uid
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

if [[ -f “/Users/Shared/.starttime.txt” ]]
then
    if [[ $(dseditgroup -o checkmember -m “$loggedInUser" admin) == "yes “$loggedInUser" is a member of admin" ]]
    then
        starttime=$(cat /Users/Shared/.starttime.txt)
        currenttime=$(date +%s)
        difference=$(echo $(( $currenttime - $starttime )))
        if [[ $difference -ge 1200 ]]
        then
            dseditgroup -o edit -d "$loggedInUser" -t user admin 
            launchctl stop com.apple.opendirectoryd
            launchctl start com.apple.opendirectoryd
            rm /Users/Shared/.starttime.txt
        else
            exit 0
        fi
    else
        rm /Users/Shared/.starttime.txt
        exit 0
    fi
else
    exit 0
fi

exit 0
