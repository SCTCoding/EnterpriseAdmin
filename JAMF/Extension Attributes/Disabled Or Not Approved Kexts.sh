#! /bin/bash

# Find all computers with Kexts that are not approved. Dump to an attribute.

## Determine if the policy file is there.
if [[ -f '/var/db/SystemPolicyConfiguration/KextPolicy' ]]
then
	## Find any disabled kexts.
	kextsDisabled=$(sqlite3 -list -separator ', ' /var/db/SystemPolicyConfiguration/KextPolicy 'select bundle_id, team_id from kext_policy where allowed = 0 group by team_id;')
	## Setup output array
	output=()
	for kext in "${kextsDisabled[@]}"
	do
		## Append to array
		output+="$kext "
	done

	## Evaluate the output
	if [[ $(echo "$output" | grep -c "," ) -ge 1 ]]
	then
		echo "<result>Unapproved Kexts: $output</result>"
	else
		echo "<result>All Kexts Approved</result>"
	fi
else
	echo "<result>No KextPolicy Database</result>"
fi

exit 0
