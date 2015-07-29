#!/bin/bash

echo 'Persons authorised by British Sky Broadcasting Ltd may use this computer
network. By completing the login process you are acknowledging and consenting
to proper use of BSkyB's computing systems in accordance with the company's
usage policy. Copies of this can be found on the intranet. If you are not an
authorised user please disconnect now.'

THRESHOLD=90

function passFail {
    RESULT=$?
    TEST=$1
    if [ $RESULT -ne 0 ]
    then
       echo -e "\e[1;31;40m[FAIL]\033[0m $TEST"
    else
       echo -e "\e[1;32;40m[PASS]\033[0m $TEST"
    fi
    return $RESULT
}

df -PkH | grep -vE '^Filesystem|tmpfs|cdrom|media|none' | awk '{ print $5 " " $6 }' | while read output;
do
    usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1 )
    partition=$(echo $output | awk '{print $2}' )
    [[ $usep -lt $THRESHOLD ]]
    passFail "Checking free disk space on $partition"

    if [[ $usep -ge $THRESHOLD ]]; then
        echo -e "ERROR Running out of space \"$partition ($usep%)\""
        echo
    fi
done
