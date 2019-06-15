#! /bin/bash

## Major Version
#majorversion=8
majorversion=$4

if [[ ! -z $(ps -Ac | grep Prism) ]]
then 
	/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -title "Preparing to Update Prism" -description "Please quit Prism before updating." -alignHeading center -alignDescription left -icon /Applications/Prism\ 8.app/Contents/Resources/AppIcon.icns
	echo "Prism is currently running."
	exit 1
fi


## Verify that the Prism app is installed.
if [[ -d "/Applications/Prism $majorversion.app" ]]
then

	## Grab full version from webpage
	#fullversion=$(defaults read /Users/$loggedInUser/Library/Preferences/com.GraphPad.Prism.plist | grep UpdaterLastCheckDate | tail -n 1 | cut -d '_' -f1 | awk '{print $2}' | cut -d '.' -f1 -f2 -f3)
	fullversion=$(/usr/bin/curl https://www.graphpad.com/updates/ | grep "The latest Prism version is" | cut -d '>' -f2 | awk '{print $6}')

	if [[ $fullversion == $(defaults read /Applications/Prism\ 8.app/Contents/Info.plist CFBundleShortVersionString) ]]
	then
		/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -title "Prism Update" -description "Prism is already the latest version." -alignHeading center -alignDescription left -icon /Applications/Prism\ 8.app/Contents/Resources/AppIcon.icns
		echo "No update required."
		exit 0
	else
		## Download
		/usr/bin/curl https://cdn.graphpad.com/downloads/prism/"$majorversion"/"$fullversion"/InstallPrism"$majorversion".dmg > /private/tmp/prism.dmg

		## Mount
		/usr/bin/hdiutil attach -noverify -nobrowse -mountpoint /private/tmp/prismupdate /private/tmp/prism.dmg

		## Move In Place
		cp -r /private/tmp/prismupdate/*.app /Applications
		/usr/bin/hdiutil detach /private/tmp/prismupdate
	
		## Cleanup
		rm /private/tmp/prism.dmg
		/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -title "Prism Update" -description "Prism has been updated to the latest version." -alignHeading center -alignDescription left -icon /Applications/Prism\ 8.app/Contents/Resources/AppIcon.icns
	fi
else
	## Exit with error if no Prism
	echo "Prism $majorversion does not exist."
	exit 1
fi

exit 0
