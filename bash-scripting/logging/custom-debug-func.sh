#!/bin/bash –xve
debug() {
echo "Executing: $@“
# Change the default log message format
PS4='+${BASH_SOURCE}: on line ${LINENO}: ${FUNCNAME[0]}: ‘

# Execute the command and check for errors
if ! "$@"; then
    echo "Error executing command: $@“
    exit 1
fi
}
# Example usage
debug ls
