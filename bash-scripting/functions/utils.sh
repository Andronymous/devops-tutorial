#!/bin/bash

function log_message {
 echo "$(date) - $1"
}

function check_file_exists {
 if [ -f "$1" ]; then
    return 0
 else
    return 1
 fi
}