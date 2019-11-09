#! /bin/bash

## This script is designed to work with PIV cards or ones conforming to ISO7816, and PINs between 4-8 characters.
## Requires OpenSC (tested on 0.17)

## OSASCRIPT User Information
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u $loggedInUser)

## Make sure a PIV card is in the reader.
#if [[ $(/usr/local/bin/opensc-tool -a 2>&1) == "Card not present." ]]
#then
#	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'display dialog "No card detected in the reader." buttons {"Dismiss"}'
#	exit 0
#fi

## Obtain the PIN number. Secrets...
pinNumber=$(/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'set output to the text returned of (display dialog "Please enter the PIN of the SmartCard you want to test:" default answer "" with hidden answer)')

## Obtain PIN length
pinLength=$(echo -n $pinNumber | wc -c)

## Make sure the pin is not null and is 4 or more long
if [[ $pinLength -eq 0 ]] || [[ $pinLength -lt 4 ]]
then
	## Error and exit if length is 0
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'display dialog "No PIN entered, or PIN enter is too short. Please try again." buttons {"Dismiss"}'
	exit 0
fi

## Determine padding
paddingFill=$(( 8-$pinLength ))

## Convert PIN to hex and add spaces. Strip any trailing characters
pinHex=$(echo -n $pinNumber | xxd -ps -c 200 | sed 's/../& /g')

## Padding table
pad1="FF"
pad2="FF FF"
pad3="FF FF FF"
pad4="FF FF FF FF"

## Construct padding the lazy way becasue I am awesome that way.
if [[ $paddingFill -eq 4 ]]
then
	apduEnd1="$pad4"
elif [[ $paddingFill -eq 3 ]]
then
	apduEnd1="$pad3"
elif [[ $paddingFill -eq 2 ]]
then
	apduEnd1="$pad2"
elif [[ $paddingFill -eq 1 ]]
then
	apduEnd1="$pad1"
else
	apduEnd1=""
fi

## Construct proper and complete APDU command.
if [[ $paddingFill -eq 0 ]]
then
	commandAPDU="00 20 00 80 08 $pinHex"
else
	commandAPDU="00 20 00 80 08 $pinHex$apduEnd1"
fi

## Reformat with :
apduFormat=$(echo "$commandAPDU" | sed 's/ /:/g' | cut -c 1-38)

#echo $apduFormat

## Dump the return of opensc to a variable
return=$(/usr/local/bin/opensc-tool -s $apduFormat 2>&1)

## Cut for SW1
returnSW1=$(echo $return | cut -d '=' -f 2 | cut -d ',' -f1)

echo "SW1 is $returnSW1"

## Cut for SW2
returnSW2=$(echo $return | cut -d '=' -f 3 | cut -d ')' -f1)

echo "SW2 is $returnSW2"

## Output handler.
if [[ "$returnSW1" == "0x90" ]] && [[ "$returnSW2" == "0x00" ]]
then
	echo "PIN Correct"
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'display dialog "PIN is correct!" buttons {"Dismiss"}'
elif [[ "$returnSW1" == "0x63" ]]
then
	echo "PIN incorrect."
	if [[ "$returnSW2" == "0xCA" ]]
	then
		triesLeft="10"
	elif [[ "$returnSW2" == "0xC9" ]]
	then
		triesLeft=$(echo -n $returnSW2 | cut 'C' -f2)
	fi
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'display dialog "PIN is incorrect. You have \"$triesLeft\"" buttons {"Dismiss"}'
elif [[ "$returnSW1" == "0x69" ]] && [[ "$returnSW2" == "0x83" ]]
then
	echo "PIN blocked."
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'display dialog "PIN is blocked." buttons {“Dismiss"}'
elif [[ "$returnSW1" == "0x69" ]] && [[ "$returnSW2" == “0x84" ]]
then
	echo "PIN blocked/data invalidated.”
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'display dialog "PIN is blocked." buttons {"Dismiss"}'
else
	echo "Card has other issues."
	/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" osascript -e 'display dialog "PIV card has other issues." buttons {"Dismiss"}'
fi

exit 0
