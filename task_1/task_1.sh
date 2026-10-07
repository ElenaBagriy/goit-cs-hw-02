#!/bin/bash

websites=(
    https://google.com
    https://facebook.com
    https://twitter.com
    )
LOG_FILE="logs.log"

check_avail() {
    status=$(curl -s -L -o /dev/null -w "%{http_code}" "$1")
    if [ "$status" -eq 200 ]
    then
        echo "$1 is UP"
        echo "$1 is UP" >> "$LOG_FILE"
    else
        echo "$1 is DOWN"
        echo "$1 is DOWN" >> "$LOG_FILE"
    fi
}

for ((i=0; i<${#websites[@]}; i++))
do
    check_avail  "${websites[i]}"
done

echo "Results have been written to $LOG_FILE"