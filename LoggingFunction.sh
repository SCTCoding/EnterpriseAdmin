#! /bin/bash

function logToFile {
	NOW=$(date +%s)
	NOWH=$(date "+%Y-%m-%d %H:%M:%S")
	logPath="$1"
	## $2 is the log text output which can be specified as a variable $log_text

	if [[ -f "$logPath" ]] && [[ $(du -h "$logPath" | awk '{print $1}' | grep -c "M") -eq 1 ]] && [[ $(du -h "$logPath" | awk '{print $1}' | grep -oE '^[0-9]{1,4}') -gt 20 ]]
	then
		echo "ROTATED: $NOW" > "$logPath"
		echo "STARTED: $NOW" >> "$logPath"
		echo "$NOW $NOWH $2" >> "$logPath"
		return
	elif [[ -f "$logPath" ]] && [[ $(du -h "$logPath" | awk '{print $1}' | grep -cE "G|T|P|E") -eq 1 ]]
	then
		echo "ROTATED: $NOW" > "$logPath"
		echo "STARTED: $NOW" >> "$logPath"
		echo "$NOW $NOWH $2" >> "$logPath"
		return
	fi

	if [[ -f "$logPath" ]] && [[ $(du -h "$logPath" | awk '{print $1}' | grep -cE 'B|K|M') -eq 1 ]]
	then
		echo "$NOW $NOWH $2" >> "$logPath"
		return
	else
		echo "STARTED: $NOW" >> "$logPath"
		echo "$NOW $NOWH $2" >> "$logPath"
		return 
	fi
}

logToFile
