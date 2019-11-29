#! /bin/bash

if [[ -f "/usr/libexec/remotectl" ]]
then

	## brige updates
	output=$(grep "SUUpdateSession: Preparing bridgeOS update for" /private/var/log/install.log | tail -n1)

	if [[ -z $output ]]
	then
		echo "<result>$(echo "$output" | awk '{print "On: " $1 " " $2 " Prepared Update: " $10}')</result>"
	else
		echo "<result>None</result>"
	fi

else
	echo "<result>Unable To Check</result>"
fi

exit 0
