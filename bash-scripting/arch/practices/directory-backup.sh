#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

dir=$1
backup_dir="backup_$(date +%Y%m%d_%H%M%S)"

mkdir -p "$backup_dir"
cp -r "$dir"/* "$backup_dir"