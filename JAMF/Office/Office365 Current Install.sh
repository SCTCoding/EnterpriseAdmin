#! /bin/bash

/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -heading "Attention" -alignHeading center -description "Please close all open office applications before running." -alignDescription center -button1 "Dismiss" -icon /Library/Application\ Support/JAMF/Jamf.app/Contents/Resources/AppIcon.icns -iconSize 128

# Obtain Current Office Installer
curl -JL https://go.microsoft.com/fwlink/?linkid=525133 -o /tmp/Office365.pkg

# Check if it downloaded
if [[ -f "/tmp/Office365.pkg" ]]
then
	installer -pkg /tmp/Office365.pkg -target /
else
	exit 1
fi

# Kill the installer once complete
rm /tmp/Office365.pkg

exit 0
