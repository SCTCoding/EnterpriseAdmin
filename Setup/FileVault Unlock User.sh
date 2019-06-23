#! /bin/bash

## User input and check for zero values.
usernameselected=$(osascript -e 'set desireduname to the text returned of (display dialog "What username would you like? (No spaces or special characters.)" default answer "" buttons {"Cancel", "Continue"} default button "Continue")')
if [[ -z $usernameselected ]]
then
	echo "This value cannot be blank."
	exit 1
fi

passwordselected=$(osascript -e 'set userpw to the text returned of (display dialog "Please enter the desired password. (Must be at least 15 characters long uppercase, lowercase, numbers and symbols)" default answer "" buttons {"Cancel", "Continue"} default button "Continue" with hidden answer)')
if [[ -z $passwordselected ]]
then
	echo "This value cannot be blank."
	exit 1
fi

adminusername=$(osascript -e 'set adminname to the text returned of (display dialog "What is the administrator username?" default answer "" buttons {"Cancel", "Continue"} default button "Continue")')
if [[ -z $adminusername ]]
then
	echo "This value cannot be blank."
	exit 1
fi

adminuserpassword=$(osascript -e 'set adminpw to the text returned of (display dialog "What is the administrator password?" default answer "" buttons {"Cancel", "Continue"} default button "Continue" with hidden answer)')
if [[ -z $adminuserpassword ]]
then
	echo "This value cannot be blank."
	exit 1
fi

## Generate a random UID outside of the standard range.
randUID=$(echo $((600 + RANDOM % 1000)))

## OS Version Check and Primary Execution
if [[ $(sw_vers | grep "ProductVersion" | cut -d '.' -f2) -eq 12 ]] && [[ $(diskutil info / | grep "File System Personality" | cut -d ':' -f2 | awk '{print $1}') != "APFS" ]]
then
	## Build User
	dscl . -create /Users/"$usernameselected"
	dscl . -create /Users/"$usernameselected" UserShell /usr/bin/false
	dscl . -create /Users/"$usernameselected" RealName "$usernameselected"
	dscl . -create /Users/"$usernameselected" UniqueID "$randUID"
	dscl . -create /Users/"$usernameselected" PrimaryGroupID 20
	dscl . -passwd /Users/"$usernameselected" "$passwordselected"

	## Add To FileVault
	expect -c "
	spawn fdesetup add -usertoadd $usernameselected
	expect \"Enter the user name:\"
	send ${adminusername}\r
	expect \"Enter the password for user '$adminusername':\"
	send ${adminuserpassword}\r
	expect \"Enter the password for the added user '$usernameselected':\"
	send ${passwordselected}\r
	expect
	"

elif [[ $(diskutil info / | grep "File System Personality" | cut -d ':' -f2 | awk '{print $1}') == "APFS" ]]
then
	## Build User
	dscl . -create /Users/"$usernameselected"
	dscl . -create /Users/"$usernameselected" UserShell /usr/bin/false
	dscl . -create /Users/"$usernameselected" RealName "$usernameselected"
	dscl . -create /Users/"$usernameselected" UniqueID "$randUID"
	dscl . -create /Users/"$usernameselected" PrimaryGroupID 20
	dscl . -passwd /Users/"$usernameselected" "$passwordselected"

	## Add To FileVault
	expect -c "
	spawn fdesetup add -usertoadd $usernameselected
	expect \"Enter the user name:\"
	send ${adminusername}\r
	expect \"Enter the password for user '$adminusername':\"
	send ${adminuserpassword}\r
	expect \"Enter the password for the added user '$usernameselected':\"
	send ${passwordselected}\r
	expect
	"

	## Add the token
	sysadminctl -adminUser "$adminusername" -adminPassword "$adminuserpassword" -secureTokenOn "$usernameselected" -password "$passwordselected"
	
	## Sync To Disk
	diskutil apfs updatePreboot /
else
	echo "The OS is too old. You need to upgrade."
	exit 1
fi


exit 0