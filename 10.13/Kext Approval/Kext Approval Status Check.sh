#! /bin/bash

# This is setup as a JAMF extension attribute, but can reconfigured in a variety of ways.

# Initializing arrays
status=()
kext_list=()

# Main logic
for kext in ${kext_list[@]}
do
  # Check if the kext is in the approved list
  if [[ $(/usr/bin/sqlite3 /var/db/SystemPolicyConfiguration/KextPolicy 'SELECT * FROM kext_policy;' | grep -c "$kext" ) -lt 1 ]]
  then
    # If not then append to array
    status=(${#status[@]} $kext)
done

# Output a JAMF usable result.
echo "<result>Not Approved: ${status[@]}</result>"

exit 0
