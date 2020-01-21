#! /bin/bash

package="$4"
logFile="$5"
hasOptions="$6"
choiceXML="$7"

function installPackage {
    if [[ -f "/private/tmp/$4" ]]
    then
        if [[ "$hasOptions" == "NO" ]]
            installer -pkg "/$package" -target / -verboseR | sed 's/installer://g; s/PHASE: //g; s/^ //g' >> "$logFile"
            installerStatus=$?
        elif [[ "$hasOptions" == "YES" ]]
        then
            installer -pkg "/$package" -target / -applyChoiceChangesXML "$choiceXML" -verboseR | sed 's/installer://g; s/PHASE: //g; s/^ //g' >> "$logFile"
            installerStatus=$?
        fi
    elif [[ ! -f "/private/tmp/$4" ]]
    then
        echo "Package $4 not found..."
        exit 1
    fi
}

function installPost {
    if [[ "$installerStatus" == "0" ]]
    then
        echo "Install of $4 succeeded..."
    elif [[ "$installerStatus" == "1" ]]
    then
        echo "Install of $4 failed..."
        reasonOption1=$(grep -c "" $logFile)
        reasonOption2=$(grep -c "" $logFile)
        reasonOption3=$(grep -c "" $logFile)
        reasonOption4=$(grep -c "" $logFile)
        if [[ $reasonOption1 -gt 0 ]] || [[ $reasonOption2 -gt 0 ]] || [[ $reasonOption3 -gt 0 ]] || [[ $reasonOption4 -gt 0 ]]
        then
            echo "Attempting re-install of $4…"
            rm "$logFile"
            if [[ "$hasOptions" == "NO" ]]
               installer -pkg "/$package" -target / -verboseR | sed 's/installer://g; s/PHASE: //g; s/^ //g' >> "$logFile"
            elif [[ "$hasOptions" == "YES" ]]
            then
                installer -pkg "/$package" -target / -applyChoiceChangesXML "$choiceXML" -verboseR | sed 's/installer://g; s/PHASE: //g; s/^ //g' >> "$logFile"
            fi
        elif [[ $reasonOption1 -gt 0 ]] && [[ $reasonOption2 -gt 0 ]] && [[ $reasonOption3 -gt 0 ]] && [[ $reasonOption4 -gt 0 ]]
            echo "Can’t recover from install failure of $4..."
        fi
    fi
}

## MAIN
installPackage

installPost

exit 0
