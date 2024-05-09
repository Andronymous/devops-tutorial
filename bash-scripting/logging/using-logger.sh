#!/bin/bash

: '
Facility : kern, user, daemon, mail, auth, local0, local7
Severities : emerg, alert, err, etc, info ,debug
'
# -p determine Facility and Severities
logger -p user.info "message to be logged"

# -i for PID -t for TAG
# -s for displaying the output while writing into syslog
logger -s -i -t to_log -p user.info "${BOLD}message to be logged"

################################################################
function to_log() {
    local FACILITY=$1
    local LOG_LEVEL=$2
    shift 2
    local MSG=$@
    logger -s -i -t to_log -p ${FACILITY}.${LOG_LEVEL} $MSG
}

# Define the green color variable
green='\033[0;32m'
# Define the red color variable
RED='\033[0;31m'
# Define the reset color variable
clear='\033[0m'

to_log user INFO "this is an ${green}info message to be logged${clear}"
to_log user INFO "this is an ${green}error message to be logged${clear}"

cat /var/log/syslog | grep to_log