#! /bin/bash

ls /Applications >> /private/tmp/applist.txt

input="/private/tmp/applist.txt"

while IFS= read -r line
do
	
	possibilities=("1Password 7.app" "Airmail 3.app")

	for possible in "${possibilities[@]}"
	do
		if [[ "$possible" == "$line" ]]
		then
			echo -n "$line:" >> /private/tmp/finalapps.txt
		fi
	done

done < "$input"

rm /private/tmp/applist.txt

rm /private/tmp/finalapps.txt

extatt=$(cat /private/tmp/finalapps.txt)

echo "<result>$extatt</result>"

exit 0