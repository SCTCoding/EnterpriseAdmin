#! /bin/bash

homepage="https://www.jamf.com"

defaults write /Library/Preferences/org.mozilla.firefox EnterprisePoliciesEnabled -bool TRUE

defaults write /Library/Preferences/org.mozilla.firefox Homepage -dict-add URL -string "$homepage"

exit 0
