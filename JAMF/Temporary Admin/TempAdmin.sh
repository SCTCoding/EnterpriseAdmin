#! /bin/bash

## Obtain username and uid
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

## Make the user admin.
dscl . -append /Groups/admin GroupMembership "$loggedInUser"
launchctl stop com.apple.opendirectoryd
launchctl start com.apple.opendirectoryd

## Dialog logic and build
if [ $(/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -title "Temporary Admin Rights" -description "Your admin rights will expire in 20 minutes. When finsihed:"  -countdown -timeout 1200 -lockHUD -button1 "Finished" -alignHeading center -alignDescription right -alignCountdown right -icon /Library/Application\ Support/JAMF/Jamf.app/Contents/Resources/AppIcon.icns) -eq 0 ]
then
	## If finished kill admin, or if timeout kill admin. 
	dseditgroup -o edit -d "$loggedInUser" -t user admin 
	launchctl stop com.apple.opendirectoryd
	launchctl start com.apple.opendirectoryd
fi
