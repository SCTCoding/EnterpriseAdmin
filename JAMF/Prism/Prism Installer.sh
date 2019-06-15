#! /bin/bash

loggedInUser=$(stat -f%Su /dev/console)

serial="$5"

if [[ ! -z $(ps -Ac | grep Prism) ]]
then 
	/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -title "Preparing to Install Prism" -description "Please quit Prism before installing the new version." -alignHeading center -alignDescription left -icon /Applications/Prism\ 8.app/Contents/Resources/AppIcon.icns
	echo "Prism is currently running."
	exit 1
fi

## Remove old Prism Apps
if [[ -e "/Applications/Prism 6.app" ]]
then
	rm -rf /Applications/Prism\ 6.app
fi

if [[ -e "/Applications/Prism 7.app" ]]
then
	rm -rf /Applications/Prism\ 7.app
fi


## Prism Config Removal
if [[ -e "/Applications/Prism\ 8.app" ]]
then
	echo "Prism 8 Installed, leaving existing license files in place."
else
	if [[ -f "/Applications/prism-config.xml" ]]
	then
		rm /Applications/prism-config.xml
	fi

	if [[ -f "/Library/Application\ Support/GraphPad/prism-config.xml" ]]
	then
		rm /Library/Application\ Support/GraphPad/prism-config.xml
	fi

	if [[ -f "/Users/$loggedInUser/Library/Application\ Support/GraphPad/prism-config.xml" ]]
	then
		rm /Users/$loggedInUser/Library/Application\ Support/GraphPad/prism-config.xml
	fi
	
	## Creating Config File
	touch /Applications/.prism-config.xml

	chmod 644 /Applications/.prism-config.xml

fi

## Fill Config File
cat << EOD > /Applications/.prism-config.xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
	<silent-activation>true</silent-activation>
	<serial-number>"$serial"</serial-number>
</configuration>

EOD

## Major Version
#majorversion=8
majorversion=$4

## Grab full version from webpage
#fullversion=$(defaults read /Users/$loggedInUser/Library/Preferences/com.GraphPad.Prism.plist | grep UpdaterLastCheckDate | tail -n 1 | cut -d '_' -f1 | awk '{print $2}' | cut -d '.' -f1 -f2 -f3)
fullversion=$(/usr/bin/curl https://www.graphpad.com/updates/ | grep "The latest Prism version is $majorversion" | cut -d '>' -f2 | awk '{print $6}')

## Download
/usr/bin/curl https://cdn.graphpad.com/downloads/prism/"$majorversion"/"$fullversion"/InstallPrism"$majorversion".dmg > /private/tmp/prism.dmg

## Mount
/usr/bin/hdiutil attach -noverify -nobrowse -mountpoint /private/tmp/prismupdate /private/tmp/prism.dmg

## Move In Place
cp -r /private/tmp/prismupdate/*.app /Applications
/usr/bin/hdiutil detach /private/tmp/prismupdate
	
## Cleanup
rm /private/tmp/prism.dmg
/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -title "Prism Installation Complete" -description "Prism has been installed successfully." -alignHeading center -alignDescription left -icon /Applications/Prism\ 8.app/Contents/Resources/AppIcon.icns

open -a /Applications/Prism\ $majorversion.app

exit 0
