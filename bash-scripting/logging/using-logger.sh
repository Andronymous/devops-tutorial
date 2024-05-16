#!/bin/bash

: '
Facility : kern, user, daemon, mail, auth, local0, local7
Severities : emerg, alert, err, etc, info ,debug
'
# -p determine Facility and Severities
logger -p user.info "message to be logged"

# -i for PID -t for TAG
# -s for displaying the output while writing into syslog
logger -s -i -t to_log -p user.info "other message to be logged"

################################################################
function to_log() {
    local FACILITY=$1
    local LOG_LEVEL=$2
    shift 2
    local MSG=$@
    logger -s -i -t to_log -p ${FACILITY}.${LOG_LEVEL} $MSG
}

to_log user INFO "this is an info message to be logged"
to_log user ERR "this is an error message to be logged"

cat /var/log/syslog | grep to_log