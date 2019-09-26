#! /bin/bash

##########
# This extension attribute collects some set of specified kernel extensions if loaded.
##########


## Global variables
## Be sure to use % as your wild card. com.apple.%
kernelSearch=""
## LIKE or NOT
version=""

## Check if osquery present. If not fix it.
if [[ ! -f "/usr/local/bin/osqueryi" ]]
then
  ## If OSQuery not present mark as such. Use any attribute with this possible field as an indicator to install osquery.
  echo <result>OSQuery Not Installed</result>
  exit 0
fi

## Check for application
if [[ "$version" == "LIKE" ]]
then
  kextList=$(/usr/local/bin/osqueryi --header=false --list "select name from kernel_extensions where name like \"$kernelSearch\" and name like \"__kernel__\";" | awk 'BEGIN{ORS=", ";} {print;}')
elif [[ "$version" == "NOT" ]]
then
  kextList=$(/usr/local/bin/osqueryi --header=false --list "select name from kernel_extensions where name not like \"$kernelSearch\" and name not like \"__kernel__\";" | awk 'BEGIN{ORS=", ";} {print;}')
fi

echo "<result>$kextList</result>"

exit 0
