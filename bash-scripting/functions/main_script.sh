#!/bin/bash

# main_script.sh

source utils.sh
# or
# . utils.sh

log_message "Starting the script"

if check_file_exists "/path/to/file"; then
 echo "File exists."
else
 echo "File does not exist."
fi
