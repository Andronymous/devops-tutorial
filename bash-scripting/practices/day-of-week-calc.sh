#!/bin/bash

echo "Enter a day of the month:"
read day

if [[ $day -lt 1 || $day -gt 31 ]]; then
    echo "Invalid day entered."
    exit 1
fi

weekday=$(( (day + 2) % 7 ))

case $weekday in
    0) echo "Sunday";;
    1) echo "Monday";;
    2) echo "Tuesday";;
    3) echo "Wednesday";;
    4) echo "Thursday";;
    5) echo "Friday";;
    6) echo "Saturday";;
esac