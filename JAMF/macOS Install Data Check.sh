#! /bin/bash

#############################################################
## Checks to see if the macOS Install Data folder is present.
#############################################################

os_version=$(sw_vers -productVersion) # Obtain OS version.

if [[ $os_version = "10.13.6" ]] # Verify 10.13.6 installed
then
	if [[ -d "/macOS Install Data" ]]
	then
		echo "<result>macOS Install Data Folder Present</result>"
	else
		echo "<result>macOS Install Data Folder Not Present</result>"
	fi
else
	echo "<result>Invalid Target</result>"
fi

exit