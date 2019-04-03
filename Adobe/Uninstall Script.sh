#! /bin/bash

## Kill Applications
runningApps=$(ps -Ac | grep Adobe* | awk '{print $1}')

for appRunning in ${runningApps[@]}
do
	kill $appRunning
done

## ID User
loggedInUser=$(stat -f%Su /dev/console)

## Applications Folder
appsInstalled=$(ls /Applications | grep Adobe*)
for appItems in ${appsInstalled[@]}
do
	rm -rf "/Applications/$appItems"
done

## Utilities Folder
utilitiesInstalled=$(ls /Applications/Utilities | grep Adobe*)
for utilitiesItems in ${utilitiesInstalled[@]}
do
	rm -rf "/Applications/Utilities/$utilitiesItems"
done

## Root Library
libAppSupport=$(ls /Library | grep Adobe*)
for appSupportItems in ${libAppSupport[@]}
do
	rm -rf "/Library/$appSupportItems"
done

libLaunchDaemons=$(ls /Library/LaunchDaemons | grep com.adobe*)
for launchDaemonsItems in ${libLaunchDaemons[@]}
do
	rm -rf "/Library/LaunchDaemons/$launchDaemonsItems"
done

libLaunchAgents=$(ls /Library/LaunchAgents | grep com.adobe*)
for launchAgentsItems in ${libLaunchAgents[@]}
do
	rm -rf "/Library/LaunchAgents/$launchAgentsItems"
done


## User Items
savedAppStates=$(ls /Users/$loggedInUser/Saved\ Application\ State)
for appStateItems in ${savedAppStates[@]}
do
	rm -rf "/Library/Saved Application State/$appStateItems"
done

userAppSupport=$(ls /Library | grep Adobe*)
for userSupportItems in ${userAppSupport[@]}
do
	rm -rf "/Users/$loggedInUser/Library/$userSupportItems"
done

libContainers=$(ls /Library/Containers | grep Adobe*)
for containerItems in ${libContainers[@]}
do
	rm -rf "/Library/Containers/$containerItems"
done

libGroupContainers=$(ls /Library/Group\ Containers | grep Adobe*)
for groupItems in ${libGroupContainers[@]}
do
	rm -rf "/Library/Group Containers/$groupItems"
done


exit 0
