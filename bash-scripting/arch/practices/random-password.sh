#!/bin/bash

if ! command -v pwgen &> /dev/null; then
    echo "pwgen could not be found. Installing..."
    sudo apt-get update && sudo apt-get install -y pwgen
fi

for user in "$@"; do
    password=$(pwgen -s 12 1)
    echo "Username: $user, Password: $password"
    echo "$user:$password" | sudo chpasswd
    sudo usermod -s /usr/sbin/nologin $user
done
