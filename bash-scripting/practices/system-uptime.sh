#!/bin/bash

# File to write system start and shutdown information
WORKBOOK_INFO_FILE="/home/andronymous/dev/workspace/workbook_info.txt"

# Function to write system start information
write_start_info() {
    echo "System started at $(date)" >> $WORKBOOK_INFO_FILE
}

# Function to write system shutdown information
write_shutdown_info() {
    echo "System shutdown at $(date)" >> $WORKBOOK_INFO_FILE
    echo "--------------------------------------------------" >> $WORKBOOK_INFO_FILE
}

# Check if the script is run at startup
if [ "$1" = "start" ]; then
    write_start_info
elif [ "$1" = "stop" ]; then
    write_shutdown_info
fi