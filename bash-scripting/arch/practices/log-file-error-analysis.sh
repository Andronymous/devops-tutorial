#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

log_file=$1
error_count=$(grep -c "ERROR" "$log_file")

echo "Number of errors: $error_count"
