#!/bin/bash

echo "Enter a number between 1 and 10:"
read num

if [[ $num -lt 1 || $num -gt 10 ]]; then
    echo "Invalid number entered."
    exit 1
fi

for ((i=1; i<=10; i++)); do
    echo "$num * $i = $((num * i))"
done
