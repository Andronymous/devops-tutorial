#!/bin/bash

echo "Enter a number between 0 and 10:"
read number

if [ "$number" -ge 0 ] && [ "$number" -le 10 ]; then
    echo "The number is between 0 and 10."
else
    echo "The number is not between 0 and 10."
fi
