#! /bin/bash

## Uninstall McAfee
# Remove McAfee
if [[ -d "/Library/McAfee/cma" ]]
then
	/Library/McAfee/cma/scripts/uninstall.sh
fi	

# Wait and make sure the cma folder is gone. If not remove it.
sleep 1.0

if [[  -d "/Library/McAfee" ]]
then
	rm -Rf /Library/McAfee
fi

# Kill LaunchAgents
launchctl stop /Library/LaunchAgents/com.mcafee.*
launchctl unload /Library/LaunchAgents/com.mcafee.*
launchctl stop /Library/LaunchDaemons/com.mcafee.*
launchctl unload /Library/LaunchDaemons/com.mcafee.*

# Delete the agents
rm -Rf /Library/LaunchAgents/com.mcafee.*
rm -Rf /Library/LaunchDaemons/com.mcafee.*


# Kill Kernel Extensions
mcafeeKextID=$( kextstat -l | grep McAfee | awk '{print $6}' )

for kexts in ${mcafeeKextID[@]}
do
	kextunload -b $kexts
done

# Kill Processes named McAfee
mcafeePID=$( ps -Ac | grep McAfee | awk '{print $1}' )
for i in ${mcafeePID[@]}
do
	kill $i
done

# Kill Processes named Menulet
menuletPID=$( ps -Ac | grep "Menulet" | awk '{print $1}' )
for i in ${menuletPID[@]}
do
	kill $i
done

## Destroy Folders
# Remove usr local folder
if [[ -d "/usr/local/McAfee" ]] 
then
	rm -Rf /usr/local/McAfee
fi

# Remove Application Support data
if [[ -d "/Library/Application\ Support/McAfee" ]]
then
	rm -Rf /Library/Application\ Support/McAfee
fi

# Remove Applications from Applications folder
if [[ -d "/Applications/McAfee*" ]]
then
	rm -Rf /Applications/McAfee*
fi

# Remove Preferences
if [[ -f "/Library/Preferences/com.mcafee*" ]]
then
	rm -Rf /Library/Preferences/com.mcafee*
fi



exit
