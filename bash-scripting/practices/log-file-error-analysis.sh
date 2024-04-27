#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <log_file>"
    exit 1
fi

log_file=$1
error_count=$(grep -c "ERROR" "$log_file")

echo "Number of errors: $error_count"


#------------------------------------------------------
# Count lines with "ERROR" (case-insensitive) using awk
#error_count=$(awk '/error/i' "$log_file" | wc -l)

#echo "The log file '$log_file' contains $error_count errors."
