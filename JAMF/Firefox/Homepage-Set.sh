#! /bin/bash

## Desired Homepage
homepage="https://www.jamf.com"
#homepage="$4"

## Enable enterprise management
defaults write /Library/Preferences/org.mozilla.firefox EnterprisePoliciesEnabled -bool TRUE

## Set homepage
defaults write /Library/Preferences/org.mozilla.firefox Homepage -dict-add URL -string "$homepage"

exit 0
