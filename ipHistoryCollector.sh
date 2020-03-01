#! /bin/bash

logPath=""

timeStamp=$(date +%F_%T)

defaultAdapter=$(route get default | grep interface | awk '{print $2}')

ipAddress=$(ifconfig $defaultAdapter | grep "inet " | awk '{print $2}')

if [[ ! -f "$logPath/.routeHistory.txt" ]]
then
	echo "$ipAddress $timeStamp" >> "$logPath/.routeHistory.txt"
else
	if [[ $(cat "$logPath"/.routeHistory.txt | wc -l) -eq 5 ]]
	then
		sed -i '' 1d "$logPath/.routeHistory.txt"
		if [[ $(cat "$logPath/.routeHistory.txt" | tail -n 1 | grep -c "$ipAddress") -lt 1 ]]
		then
			echo "$ipAddress $timeStamp" >> "$logPath/.routeHistory.txt"
		fi
	else
		if [[ $(cat "$logPath/.routeHistory.txt" | tail -n 1 | grep -c "$ipAddress") -lt 1 ]]
		then
			echo "$ipAddress $timeStamp" >> "$logPath/.routeHistory.txt"
		fi
	fi
fi

echo "<result>$(cat "$logPath/.routeHistory.txt")</result>"

exit 0
