#! /bin/bash

osVersion=$(sw_vers -productVersion | awk -F. '{print $2}')

if [[ $osVersion -ge 15 ]]
then
	/usr/bin/dscl /Local/Default -authonly localadmin password

	/usr/bin/expect << TOKEN

spawn profiles install -type bootstraptoken
expect "Enter the admin user name:"
send "localadmin\n"
expect "Enter the password for user"
send "password\n"
expect "profiles"
interact
TOKEN

fi
