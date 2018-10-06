#! /bin/bash

# Determine if Cylance kext is loaded.
if [[ $(/usr/sbin/kextstat -l | grep -c com.Cylance.*) -lt 1 ]]
then
  # Determine if Cylance kext is approved.
  if [[ $(/usr/bin/sqlite3 /var/db/SystemPolicyConfiguration/KextPolicy 'SELECT * FROM kext_policy;' | grep -c "Cylance") -lt 1 ]]
  then
    # If not approved then approve it and load the kext
    /usr/sbin/spctl kext-consent add 6ENJ69K633
    /sbin/kextload /System/Library/Extensions/CyProtectDrvOSX.kext
  else
    # Otherwise just load the kext
    /sbin/kextload /System/Library/Extensions/CyProtectDrvOSX.kext
  fi
  # Reload the launch agent
  /bin/launchctl stop com.cylance.agent_service
  /bin/launchctl start com.cylance.agent_service
else
  # If kext is loaded just reload the launch agent
  /bin/launchctl stop com.cylance.agent_service
  /bin/launchctl start com.cylance.agent_service
fi

exit
