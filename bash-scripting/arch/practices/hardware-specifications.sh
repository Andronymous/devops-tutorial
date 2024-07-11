#!/bin/bash

echo "CPU: $(lscpu | grep 'Model name:' | cut -d ':' -f 2)"
echo "Memory: $(free -h | grep Mem | awk '{print $2}')"
echo "Disk Space: $(df -h / | tail -1 | awk '{print $4}')"
