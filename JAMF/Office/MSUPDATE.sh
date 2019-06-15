#! /bin/bash

## This script will force Office applications to update using the msupdate tool.

## Copyright (C) 2019  Simon Carlson-Thies
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.

## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.

## You should have received a copy of the GNU General Public License
## along with this program.  If not, see https://www.gnu.org/licenses/.


## Check if Office updates are available
msupdates_notavailable=$(/Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate -l | grep -c "No updates available")

## Network up check
Network_Up=$(ping -c 5 www.google.com | grep -c "5 packets transmitted, 5 packets received, 0.0% packet loss")

## Verify that updates are available and that the network is up.
if [[ $(ps -A | grep -E "Microsoft|Skype for Business" | grep -v "grep" | grep -v "com.microsoft.autoupdate.helper") ]]
#if [[ -z $msupdtes_notavailable ]] && [[ $Network_Up == 1 ]] && [[ -f "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/msupdate" ]]
then
	## Check if any Microsoft Applications or Skype For Business are running.
	if [[ -z $msupdtes_notavailable ]] && [[ $Network_Up == 1 ]] && [[ -f "/Library/Application Support/Microsoft/MAU2.0/Microsoft AutoUpdate.app/Contents/MacOS/msupdate" ]]
	#if [[ $(ps -A | grep -E "Microsoft|Skype for Business" | grep -v "grep") ]]
	then
		/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -heading "Attention" -alignHeading center -description "Some Microsoft Applications may be open. Please close before continuing." -alignDescription center -button1 "Dismiss" -icon /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/Resources/AppIcon.icns -iconSize 128
		exit 1
	else
		## Force mass update
		/Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --install
	fi
else
	## Error check if network down and alert. Otherwise provide the reason of no updates available.
	if [[ -z $Network_Up ]]
	then
		## Network is down
		/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -heading "Attention" -alignHeading center -description "Your network connection does not appear to be up." -alignDescription center -button1 "Dismiss" -icon /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/Resources/AppIcon.icns -iconSize 128
		exit 1
	else
		## Display message no updates available.
		/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType hud -heading "Attention" -alignHeading center -description "No updates available." -alignDescription center -button1 "Dismiss" -icon /Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/Resources/AppIcon.icns -iconSize 128
		exit 0
	fi
fi

exit 0
