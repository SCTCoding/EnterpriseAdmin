#! /bin/bash

name="$1"
source="$2"

dmgPassword=$(/usr/bin/openssl rand -hex 64)

echo -n "$dmgPassword" | /usr/bin/hdiutil create -encryption -stdinpass -srcfolder "$source" "/private/tmp/$name"

dmgHash=$(/sbin/md5 -q "/private/tmp/$name")

echo "DMG Password Is: $dmgPassword"
echo "DMG MD5 Is: $dmgHash"

exit 0