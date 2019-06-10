#! /bin/bash

######################################
# Simon Carlson-Thies | May 2019
# Ask to override gatekeeper
######################################


## Obtain username and uid
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

## Create local script
cat << EOD > /private/tmp/gatekeeperoverride.sh
#! /bin/bash

osascript <<END
set theSelect to choose file with prompt "Please select the application you wish to open:"
set theTarget to POSIX path of theSelect
do shell script "echo " & theTarget & ">> /private/tmp/select.txt"

END

exit 0

EOD

## Make script executable
/bin/chmod +x /private/tmp/gatekeeperoverride.sh

## Run the script as logged in user
/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" "/private/tmp/gatekeeperoverride.sh"

## Check that the value returned by the user was YES. If not, and the script did not quit as it should have, then exit 1.
if [[ -f "/private/tmp/select.txt" ]]
then
	appname=$(cat /private/tmp/select.txt)
	/usr/sbin/spctl --add "$appname"
	
	/usr/bin/open -a "$appname"
	
	rm /private/tmp/gatekeeperoverride.sh
	rm /private/tmp/select.txt
else
	rm /private/tmp/gatekeeperoverride.sh
	exit 0
fi

exit 0
