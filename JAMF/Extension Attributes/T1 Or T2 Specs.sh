#! /bin/bash

if [[ -f "/usr/libexec/remotectl" ]]
then
	if [[ -z $(/usr/libexec/remotectl list) ]]
	then
		echo "<result>No T1 or T2</result>"
	else
		## Run Once
		remoteOutput=$(/usr/libexec/remotectl list)

		bridgeVersion=$(echo "$remoteOutput" | awk '{print $3" "$4}')
		osVersion=$(echo "$remoteOutput" | awk '{print $5}')
		firmwareVersion=$(echo "$remoteOutput" | awk '{print $6}' | cut -d '(' -f2 | cut -d '/' -f1)

		echo "<result>iBridge: $bridgeVersion OS: $osVersion Firmware: $firmwareVersion</result>"

	fi

else
	echo "<result>Unable To Check</result>"
fi

exit 0
