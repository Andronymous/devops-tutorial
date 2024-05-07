#!/bin/bash

LOG_FILE="/var/log/to_log.log"

# custom functions
function to_log() {
    local LOG_LEVEL=$1
    shift 1
    local MESSAGE=$@
    TIMESTAMP=$(date +'%Y-%m-%d %T')
    HOST=$(hostname)
    echo "${TIMESTAMP} ${HOST}[$$] $LOG_LEVEL $MESSAGE" >> "$LOG_FILE"
}

echo "Starting script..." >> $LOG_FILE

# # Your script logic here
to_log INFO "this is an info log"

echo "Script completed." >> $LOG_FILE

cat $LOG_FILE
