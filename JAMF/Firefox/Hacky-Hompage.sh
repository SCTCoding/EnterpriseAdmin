#! /bin/bash

## Determine logged in user
loggedInUser=$(stat -f "%Su" /dev/console)

## Determine profile name for current Firefox user
profileName=$(cat /Users/$loggedInUser/Library/Application\ Support/Firefox/profiles.ini | grep "Default=Profiles" | cut -d '/' -f2)

## Determine directory where profile lives
profileDir="/Users/$loggedInUser/Library/Application Support/Firefox/Profiles"

## Determine current home page
homePage=$(cat "$profileDir/$profileName"/prefs.js | grep '"browser.startup.homepage",' | cut -d ',' -f2 | cut -d '"' -f2)

## Find the prefs.js and edit
if [[ $(cat "$profileDir/$profileName"/prefs.js | grep -c '"browser.startup.homepage",') -eq 1 ]]
then
	## If exists edit with sed
	sed -i '' "s/$homePage/www.jamf.com/g" "$profileDir/$profileName/prefs.js"
else
	## If not exist then postpend with echo
	echo 'user_pref("browser.startup.homepage", "www.jamf.com");' >> "$profileDir/$profileName"/prefs.js
fi

exit 0
