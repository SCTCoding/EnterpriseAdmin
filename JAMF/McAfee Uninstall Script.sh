#! /bin/bash

## Uninstall McAfee
# Remove McAfee

if [[ -d "/Library/McAfee/cma/scripts/uninstall.sh" ]]
then
	/Library/McAfee/cma/scripts/uninstall.sh
else
	/Library/McAfee/cma/uninstall.sh
fi	

# Wait and make sure the cma folder is gone. If not remove it.
sleep 1.0

if [[  -d "/Library/McAfee" ]]
then
	rm -Rf /Library/McAfee 2>/dev/null
fi

## LaunchAgents/Daemons
# Stop and Unload all LaunchAgents and Daemons
# LaunchAgents
/bin/launchctl stop /Library/LaunchAgents/com.mcafee.*
/bin/launchctl unload /Library/LaunchAgents/com.mcafee.*

# LaunchDaemons
/bin/launchctl stop /Library/LaunchDaemons/com.mcafee.*
/bin/launchctl unload /Library/LaunchDaemons/com.mcafee.*

# Remove all unloaded items
rm -Rf /Library/LaunchAgents/com.mcafee.*
rm -Rf /Library/LaunchDaemons/com.mcafee.*


## Kext Handling
# Unload the kext files. They wull be deleted during the folder deletions.
MCAFEEKEXTID=$( /usr/sbin/kextstat -l | grep McAfee | awk '{print $6}' )

for kexts in ${MCAFEEKEXTID[@]}
do
	/sbin/kextunload -b $kexts
done

## Kill McAfee Processes
# Declare array of processes
declare -a MCAFEEPROCS
MCAFEEPROCS=("McAfee" "Menulet")

# Kill Processes Loop
for process in ${MCAFEEPROCS[@]}
do
	kill $(/bin/ps -Ac | grep $process | awk '{print $1}') 2>/dev/null
done

## Destroy Folders
# Create the folder list
declare -a FOLDERSTOREMOVE
FOLDERSTOREMOVE=("/usr/local/McAfee" "/Library/Application\ Support/McAfee" "/Applications/McAfee*" "/Library/Preferences/com.mcafee*" "/etc/cma*")

# Loop through array and check for existence then remove.
for item in ${FOLDERSTOREMOVE[@]}
do
	if [[ -d "$item" ]] 
	then
		rm -Rf $item 2>/dev/null
	fi
done

exit