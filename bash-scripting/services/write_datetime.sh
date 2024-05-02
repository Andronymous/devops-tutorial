#!/bin/bash

# Define the output file
OUTPUT_FILE="datetime.txt"

# Loop indefinitely
while true; do
    # Write the current date and time to the file
    date '+%Y-%m-%d %H:%M:%S' >> "$OUTPUT_FILE"
    # Wait for 10 seconds before the next iteration
    sleep 10
done
