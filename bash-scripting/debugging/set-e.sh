#!/bin/bash
set -e
non_existent_command
echo "This won't be printed"
set +e