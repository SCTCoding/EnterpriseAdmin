#! /bin/bash

##########
# This extension attribute collects if an application is installed 
# and reports installed version or not installed.
##########


## Global variables
applicationName=""
osqueryEvent=""

## Check if osquery present. If not fix it.
if [[ ! -f "/usr/local/bin/osqueryi" ]]
then
  jamf policy -event "$osqueryEvent"
fi

## Check for application
appCheck=$(/usr/local/bin/osqueryi --header=false --list "select name, bundle_short_version from apps where name is \"$applicationName\"")

## Primary check logic. Outputs application name and version.
if [[ ! -z "$appCheck" ]]
then
  if [[ ! -z $(echo $appCheck | cut -d '|' -f2 | tail -n1) ]]
  then
    echo "<result>$(echo $appCheck | cut -d '|' -f2 | tail -n1)</result>"
  else
    echo "<result>Installed</result>"
  fi
else
  echo "<result>Not Installed</result>"
fi

exit 0
