#! /bin/bash

## Determine logged in user
loggedInUser=$(stat -f "%Su" /dev/console)

## Determine profile name for current Firefox user
profileName=$(cat /Users/$loggedInUser/Library/Application\ Support/Firefox/profiles.ini | grep "Default=Profiles" | cut -d '/' -f2)

## New Home To Set
newHome="$4"

## Determine directory where profile lives
profileDir="/Users/$loggedInUser/Library/Application Support/Firefox/Profiles"

## Find the prefs.js and edit
if [[ $(cat "$profileDir/$profileName"/prefs.js | grep -c '"browser.startup.homepage",') -eq 1 ]]
then
	## If exists edit with sed
	sed -i '' "s/$homePage/$newHome/g" "$profileDir/$profileName/prefs.js"
fi

exit 0
