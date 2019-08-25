#! /bin/bash

## Global variables
applicationName=""
osqueryEvent=""

## Check if osquery present. If not fix it.
if [[ ! -f "/usr/local/bin/osqueryi" ]]
then
  jamf policy -event "$osqueryEvent"
fi

## Check for application
appCheck=$(/usr/local/bin/osqueryi --header=false --line "select name, bundle_short_version from apps where name is \"$applicationName\"" --separator ' ')

## Primary check logic. Outputs application name and version.
if [[ ! -z "$appCheck" ]]
then
  echo "<result>$appCheck</result>"
else
  echo "<result>Not Installed</result>"
fi

exit 0
