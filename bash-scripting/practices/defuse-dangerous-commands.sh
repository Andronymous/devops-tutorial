#!/bin/bash

# Specify the keywords to search for
KEYWORDS=("reboot" "poweroff" "systemctl " "delete " "rm " "mv " "kill" "fsck" "passwd" "iptables" "chmod" "chown" "dd" "mkfs" "restart")

# Loop through each keyword
for keyword in "${KEYWORDS[@]}"; do
  # Search for commands in history containing the keyword
  while read -r line; do
    if [[ "$line" == *"$keyword"* && "${line:0:17}" != "dangerous-command" ]]; then
      # Prepend "dangerous-command" to the beginning of the line and write it to a temporary file
      echo "dangerous-command $line" >> /tmp/history.tmp
    else
      # Write the original line to the temporary file without modification
      echo "$line" >> /tmp/history.tmp
    fi
  done < ~/.bash_history

  # Overwrite the original history file with the modified history
  cp /tmp/history.tmp ~/.bash_history

  # Remove the temporary file
  rm /tmp/history.tmp
done