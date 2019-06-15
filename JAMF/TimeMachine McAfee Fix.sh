#! /bin/bash

if [ $(/usr/bin/defaults read /Library/Preferences/com.apple.TimeMachine.plist SkipPaths | grep -c "/Quarantine") -eq 0 ]
then
	/usr/bin/defaults write /Library/Preferences/com.apple.TimeMachine.plist SkipPaths -array-add "/Quarantine"
else
	exit
fi

exit 0