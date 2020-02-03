#! /bin/bash -xv

exec 3>&1 4>&2
trap 'exec 3>&1 4>&2' 0 1 2 3 RETURN
exec 1>$name.log 2>&1

# script

# hide stuff
# value to hide
# value to display instead
# one per value
sed -i '' “s/$value/$hidden/" out.log


exit 0
# return & exit 0
