#!/bin/bash

# main_script.sh

source utils.sh
# or
# . utils.sh

log_message "Starting the script"

if check_file_exists "/home/andronymous/dev/workspace/andronymous/devops-tutorial/bash-scripting/functions/return-functions.sh"; then
 echo "File exists."
else
 echo "File does not exist."
fi
