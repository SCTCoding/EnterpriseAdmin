#! /bin/bash

function diskSpaceHandler {
	## Outputs percentage and then bytes free of each volume with the volume name

	option="$1"
	
	for volume in /Volumes/*
	do
		diskFreeSpace=$(diskutil info "$volume" | grep "Volume Free Space" | grep -oE '\([0-9]{1,3}\.[0-9]{1,3}%\)$' | cut -d '(' -f2  | cut -d '%' -f1)
		diskFreeBytes=$(diskutil info "$volume" | grep "Volume Free Space" | awk -F':' '{print $2}' | awk '{print $3}' | cut -d '(' -f2)
		
		if [[ "$option" == "percent" ]]
		then
			echo "$volume $diskFreeSpace"
		elif [[ "$option" == "bytes" ]]
		then
			echo "$volume $diskFreeBytes"
		else
			echo "$volume $diskFreeSpace $diskFreeBytes"
		fi

	done

}

diskSpaceHandler