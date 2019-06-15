#! /bin/bash

if [[ $(defaults read /Library/Preferences/com.apple.security.smartcard DisabledTokens | grep -c "com.apple.CryptoTokenKit.pivtoken" 2>/dev/null) = 0 ]] && [[ -f "/usr/local/bin/opensc-tool" ]]
then
	/usr/bin/defaults write /Library/Preferences/com.apple.security.smartcard DisabledTokens -array com.apple.CryptoTokenKit.pivtoken 
else
	exit 0
fi

exit 0