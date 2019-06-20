#! /bin/bash

######################################
# Simon Carlson-Thies | May 2019
# Ask For Dock Icon
######################################


## Obtain username and uid
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

## Set the application name to display to the user.
appname=$4
echo $appname > /private/tmp/appname.txt


## Create local script
cat << EOD > /private/tmp/DockChoice.sh
#! /bin/bash

osascript <<END
set dockname to do shell script "cat /private/tmp/appname.txt"
display dialog "Would you like to add " & dockname & " to your dock?" buttons {"No", "Yes"} default button 2
if button returned of result = "No" then
	do shell script "rm /private/tmp/appname.txt"
	quit
else
	if button returned of result = "Yes" then
		do shell script "echo \"YES\" > /private/tmp/UserSelect.txt"
	end if
end if
END

exit 0

EOD

## Make script executable
/bin/chmod +x /private/tmp/DockChoice.sh

## Run the script as logged in user
/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" "/private/tmp/DockChoice.sh"

## Specify the policy event that will add to the dock.
policy=$5

## Check that the value returned by the user was YES. If not, and the script did not quit as it should have, then exit 1.
if [[ $(cat /private/tmp/UserSelect.txt) == "YES" ]]
then
	jamf policy -event $policy
	
	## Cleanup
	rm /private/tmp/appname.txt
	rm /private/tmp/DockChoice.sh
	rm /private/tmp/UserSelect.txt
else
	rm /private/tmp/appname.txt
	exit 0
fi

exit 0


