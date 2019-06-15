#!/bin/sh
#
# 
lang="en-US"
dmgfile="FF.dmg"
#
## Get OS version and adjust for use with the URL string
OSvers_URL=$( sw_vers -productVersion | sed 's/[.]/_/g' )

## Set the User Agent string for use with curl
userAgent="Mozilla/5.0 (Macintosh; Intel Mac OS X ${OSvers_URL}) AppleWebKit/535.6.2 (KHTML, like Gecko) Version/5.2 Safari/535.6.2"

# Get the latest version of Firefox ESR available from Firefox page.
latestver=`/usr/bin/curl -s -A "$userAgent" https://www.mozilla.org/${lang}/firefox/new/ | grep 'data-esr-versions' | sed -e 's/.* data-esr-versions="\(.*\)".*/\1/' -e 's/\"//' | /usr/bin/awk '{print $1}'`

# Get the version number of the currently-installed FF, if any.
if [ -e "/Applications/Firefox.app" ]; then
     currentinstalledver=`/usr/bin/defaults read /Applications/Firefox.app/Contents/Info CFBundleShortVersionString`
     if [ ${latestver} = ${currentinstalledver} ]; then
          exit 0
     fi
else
     currentinstalledver="none"
fi

url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/${latestver}esr/mac/${lang}/Firefox%20${latestver}esr.dmg"

/usr/bin/curl -s -o /tmp/${dmgfile} ${url}
/usr/bin/hdiutil attach /tmp/${dmgfile} -nobrowse -quiet
        
cp -R /Volumes/Firefox/*.app /Applications/Firefox.app

/usr/bin/hdiutil detach $(/bin/df | /usr/bin/grep Firefox | awk '{print $1}') -quiet

/bin/rm /tmp/${dmgfile}


exit 0