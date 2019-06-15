#! /bin/bash

# Identify if Chrome is running.
chromeprocs=$(/bin/ps -Ac | grep "Google Chrome" | awk '{print $1}')

# Main logic
if [[ ! -d "/Applications/Google Chrome.app" ]] && [[ -z $(/bin/ps -Ac | grep "Google Chrome" | awk '{print $1}') ]]
	# If Chrome is not running and does not exist then simply install.
then
	/usr/bin/curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg > /tmp/googlechrome.dmg
	/usr/bin/hdiutil attach -noverify -nobrowse -mountpoint /tmp/chrome /tmp/googlechrome.dmg
	cp -r /tmp/chrome/*.app /Applications
	/usr/bin/hdiutil detach /tmp/chrome
elif [[ -d "/Applications/Google Chrome.app" ]] && [[ ! -z $(/bin/ps -Ac | grep "Google Chrome" | awk '{print $1}') ]]
then
	# Chrome exists and is running then quit the process and install.
	for i in ${chromeprocs[@]}
	do
		kill $i
	done
	/usr/bin/curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg > /tmp/googlechrome.dmg
	/usr/bin/hdiutil attach -noverify -nobrowse -mountpoint /tmp/chrome /tmp/googlechrome.dmg
	cp -r /tmp/chrome/*.app /Applications
	/usr/bin/hdiutil detach /tmp/chrome
else
	# If all else fails just install Chrome.
	/usr/bin/curl https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg > /tmp/googlechrome.dmg
	/usr/bin/hdiutil attach -noverify -nobrowse -mountpoint /tmp/chrome /tmp/googlechrome.dmg
	cp -r /tmp/chrome/*.app /Applications
	/usr/bin/hdiutil detach /tmp/chrome
fi

# Cleanup afterwards
rm -r /tmp/googlechrome.dmg

exit 0