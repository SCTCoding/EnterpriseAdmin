#! /bin/bash

function system_clean {
	## Clean launch servcies
	/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
	
	## Clean dyld cache
	/usr/bin/update_dyld_shared_cache -root / -force &>/dev/null

	## Clean XPC cache
	/usr/libexec/xpchelper --rebuild-cache
	
	## Clean CoreDuet database
	if [[ -d "/var/db/CoreDuet" ]]
	then
		rm -R /var/db/CoreDuet/*
	else
		exit 0
	fi
}

system_clean

exit 0