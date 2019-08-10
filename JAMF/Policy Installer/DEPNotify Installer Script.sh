#! /bin/bash

#Global Variables
policyID=""
logDEP="/private/tmp/installDEP-$policyID.txt"
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

## Enable Registration
needsInput="NO" ## YES or NO

## Registration Inputs
textField1="YES" ## YES or NO
textField2="YES" ## YES or NO
popupMenu1="NO" ## YES or NO
popupMenu2="NO" ## YES or NO
popupMenu3="NO" ## YES or NO
popupMenu4="NO" ## YES or NO

## JAMF Commands
step1Command=""
step2Command=""
step3Command=""
step4Command=""
step5Command=""

## Website
showWebsite="NO" ## YES or NO

#############################################################################
## Prepare to run
## Remove old logs if they exist.
if [[ -d "$logDEP" ]]
then
	rm "$logDEP"
fi

## Make the log file and then permission so everyone can read and write the file.
touch "$logDEP"
chmod 666 "$logDEP"

## Setup the inital log with the inital values.
echo "Command: KillCommandFile" >> "$logDEP"
echo "Command: MainTitle: Executing Policy XYZ" >> "$logDEP"
echo "Command: Determinate: 5" >> "$logDEP"
echo "Command: Image: " >> "$logDEP"
echo "Command: MainTextImage: /private/tmp/resourceImages/main.png" >> "$logDEP"
echo "Command: MainText: Please wait while the policy runs..." >> "$logDEP"


#############################################################################
## Registration Dialog Needed
if [[ $needsInput == "YES" ]]
then
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify registrationMainTitle ""
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify registrationPicturePath ""
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify registrationButtonLabel "Continue"

	if [[ $textField1 == "YES" ]]
	then
		## Text Field 1
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify textField1Label ""
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify textField1Placeholder ""
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify textField1IsOptional -bool false
	fi

	if [[ $textField2 == "YES" ]]
	then
		## Text Field 2
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify textField2Label ""
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify textField2Placeholder ""
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify textField2IsOptional -bool false
	fi

	if [[ $popupMenu1 == "YES" ]]
	then
		## Popup Menu 1
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify popupButton1Label ""
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify popupButton1Content -array "" ""
	fi

	if [[ $popupMenu2 == "YES" ]]
	then
		## Popup Menu 2
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify popupButton2Label ""
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify popupButton2Content -array "" ""
	fi

	if [[ $popupMenu3 == "YES" ]]
	then
		## Popup Menu 3
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify popupButton3Label ""
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify popupButton3Content -array "" ""
	fi
	
	if [[ $popupMenu4 == "YES" ]]
	then
		## Popup Menu 4
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify popupButton4Label ""
		/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" defaults write menu.nomad.DEPNotify popupButton4Content -array "" ""
	fi
fi

#############################################################################
## Start DEP Notify
if [[ -d "/Applications/Utilities/DEPNotify.app" ]]
then
	if [[ -f "/Users/$loggedInUser/Library/Preferences/menu.nomad.DEPNotify.plist" ]]
	then
		sudo -u $loggedInUser open -a /Applications/Utilities/DEPNotify.app --args -path "$logDEP"
	else
		rm "$logDEP"
		rm /Users/"$loggedInUser"/Library/Preferences/menu.nomad.DEPNotify.plist
		exit 1	
	fi
else
	rm "$logDEP"
	exit 1
fi


## Primary execution loop.
#############################################################################
## Step 1
if [[ $needsInput == "YES" ]]
then
	if [[ -z "$step1Command" ]]
	then
		echo "Command: ContinueButtonRegister: Continue" >> "$logDEP"

		echo "Command: WindowStyle: Activate" >> "$logDEP"

		echo "Status: Beginning Process..." >> "$logDEP"
		## Insert Do Something Here
	else
		echo "Command: ContinueButtonRegister: Continue" >> "$logDEP"

		echo "Command: WindowStyle: Activate" >> "$logDEP"

		echo "Status: Beginning Process..." >> "$logDEP"
		jamf policy -event $step2Command
	fi

else
	if [[ -z "$step1Command" ]]
	then
		echo "Command: WindowStyle: Activate" >> "$logDEP"

		echo "Status: Beginning Process..." >> "$logDEP"
		## Insert Do Something Here
	else
		echo "Command: WindowStyle: Activate" >> "$logDEP"

		echo "Status: Beginning Process..." >> "$logDEP"
		jamf policy -event $step2Command
	fi
fi
#############################################################################

#############################################################################
## Step 2
if [[ -z "$step2Command" ]]
then
	if [[ $showWebsite == "YES" ]]
	then
		echo "Command: Website: https://apple.com"  >> "$logDEP"
	fi

	echo "Status: ..." >> "$logDEP"
	## Insert Do Something Here
else
	if [[ "$showWebsite" == "YES" ]]
	then
		echo "Command: Website: https://apple.com"  >> "$logDEP"
	fi

	echo "Status: ..." >> "$logDEP"
	jamf policy -event $step2Command
fi
#############################################################################

#############################################################################
## Step 3
if [[ -z "$step3Command" ]]
then
	echo "Status: ..." >> '$logDEP'
	## Insert Do Something Here
else
	echo "Status: ..." >> "$logDEP"
	jamf policy -event $step3Command
fi
#############################################################################

#############################################################################
## Step 4
if [[ -z "$step4Command" ]]
then
	echo "Status: ..." >> "$logDEP"
	## Insert Do Something Here
else
	echo "Status: ..." >> "$logDEP"
	jamf policy -event $step4Command
fi
#############################################################################

#############################################################################
## Step 5
if [[ -z "$step5Command" ]]
then
	echo "Command: WindowStyle: Activate" >> "$logDEP"
	echo "Command: MainTextImage: /private/tmp/resourceImages/main.png" >> "$logDEP"
	echo "Command: MainText: Please wait while the policy runs..." >> "$logDEP"
	echo "Status: Finishing Up..." >> "$logDEP"
	## Insert Do Something Here
else
	echo "Command: WindowStyle: Activate" >> "$logDEP"
	echo "Command: MainTextImage: /private/tmp/resourceImages/main.png" >> "$logDEP"
	echo "Command: MainText: Please wait while the policy runs..." >> "$logDEP"
	echo "Status: Finishing Up..." >> "$logDEP"
	jamf policy -event $step5Command
fi
#############################################################################

#############################################################################
## Finish up the process by waiting so the user can read any final text for two seconds. Cleanup by removing the log file.
sleep 2.0

## Kill DEPNotify
echo "Command: Quit" >> "$logDEP"

## Delete the DEP log
if [[ -d "$logDEP" ]]
then
	rm "$logDEP"
fi

## Delete any other created files.
# Removing config files in /var/tmp
rm /var/tmp/depnotify* 2>/dev/null

# Removing bom files in /var/tmp
rm /var/tmp/com.depnotify.* 2>/dev/null

# Removing plists in local user folder
rm /Users/"$loggedInUser"/Library/Preferences/menu.nomad.DEPNotify* 2>/dev/null

# Restarting cfprefsd due to plist changes
killall cfprefsd

exit 0
