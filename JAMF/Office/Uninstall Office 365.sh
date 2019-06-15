#! /bin/bash

loggedInUser=$(stat -f%Su /dev/console)

## Application Removal
if [[ -e "/Applications/Microsoft Excel.app" ]] 
then
	rm -rf /Applications/Microsoft\ Excel.app
fi

if [[ -e "/Applications/Microsoft OneNote.app" ]] 
then
	rm -rf /Applications/Microsoft\ OneNote.app
fi

if [[ -e "/Applications/Microsoft Outlook.app" ]] 
then
	rm -rf /Applications/Microsoft\ Outlook.app
fi

if [[ -e "/Applications/Microsoft PowerPoint.app" ]] 
then
	rm -rf /Applications/Microsoft\ PowerPoint.app
fi

if [[ -e "/Applications/Microsoft Teams.app" ]] 
then
	rm -rf /Applications/Microsoft\ Teams.app
fi

if [[ -e "/Applications/Microsoft Word.app" ]] 
then
	rm -rf /Applications/Microsoft\ Word.app
fi

if [[ -e "/Applications/Skype for Business.app" ]] 
then
	rm -rf /Applications/Skype\ for\ Business.app
fi


## Remove root level library support files
if [[ -e "/Library/Application Support/Microsoft" ]] 
then
	rm -rf /Library/Application\ Support/Microsoft
fi

## Remove Launch Agents/Daemons
rm -rf /Library/LaunchAgents/com.microsoft*

rm -rf /Library/LaunchDaemons/com.microsoft*


## User level files
if [[ -e "/Users/$loggedInUser/Library/Application Support/Microsoft AutoUpdate" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Application\ Support/Microsoft\ AutoUpdate
fi

if [[ -e "/Users/$loggedInUser/Library/Application Support/Microsoft AU Daemon" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Application\ Support/Microsoft\ AU\ Daemon
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.errorreporting" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.errorreporting
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.Excel" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.Excel
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.netlib.shipassertprocess" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.netlib.shipassertprocess
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.Office365ServiceV2" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.Office365ServiceV2
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.Outlook" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.Outlook
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.Powerpoint" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.Powerpoint
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.RMS-XPCService" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.RMS-XPCService
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.Word" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.Word
fi

if [[ -e "/Users/$loggedInUser/Library/Containers/com.microsoft.onenote.mac" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Containers/com.microsoft.onenote.mac
fi

if [[ -e "/Users/$loggedInUser/Library/Group Containers/UBF8T346G9.ms" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Group\ Containers/UBF8T346G9.ms
fi

if [[ -e "/Users/$loggedInUser/Library/Group Containers/UBF8T346G9.Office" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Group\ Containers/UBF8T346G9.Office
fi

if [[ -e "/Users/$loggedInUser/Library/Group Containers/UBF8T346G9.OfficeOsfWebHost" ]] 
then
	rm -rf /Users/$loggedInUser/Library/Group\ Containers/UBF8T346G9.OfficeOsfWebHost
fi

## Saved App States
rm -rf /Users/$loggedInUser/Library/Saved\ Application\ State/com.microsoft.*
