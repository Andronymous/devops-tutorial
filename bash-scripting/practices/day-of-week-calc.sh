#!/bin/bash

echo "Enter a day of the month:"
read day

if [[ ! "$day" =~ ^[1-9][0-9]?$ || $day -lt 1 || $day -gt 31 ]]; then
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


#--------------------------------
# second script without case using arrays
# Define an array to map day of month to day of week (offset by 1 for Tuesday)
#weekdays=(Tuesday Wednesday Thursday Friday Saturday Sunday Monday)

# Calculate the index in the weekdays array (offset by -1)
#index=$(( (day - 1) % 7 ))

# Print the day of the week
#echo "The day of the week is: ${weekdays[$index]}"
