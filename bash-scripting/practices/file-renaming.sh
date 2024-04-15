#!/bin/bash

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <directory> [postfix]"
    exit 1
fi

dir=$1
postfix=${2:-"-bkp"}

for file in "$dir"/*; do
    mv "$file" "${file}${postfix}"
done
