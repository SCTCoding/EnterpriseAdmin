#! /bin/bash

if [[ -d "/macOS Install Data" ]]
then
	updateID=$(/usr/sbin/softwareupdate -l | grep "Security Update 2019" | head -n1 | cut -d '*' -f2 | cut -d ' ' -f2 -f3 -f4)

	if [[ ! -z "$updateID" ]]
	then
		/usr/sbin/softwareupdate --install -R "$updateID"
	else
		echo "Update Not Found. Failing."
		exit 1
	fi
else
	echo "No fix required."
fi

exit 0
