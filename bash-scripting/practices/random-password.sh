#!/bin/bash

# Install password generator
if ! command -v pwgen &> /dev/null; then
    echo "pwgen could not be found. Installing..."
    sudo apt-get update && sudo apt-get install -y pwgen
fi

# Array of custom usernames
usernames=("user1" "user2" "user3")

# Function to generate a random password
generate_password() {
    # You can customize the password generation logic as needed
    # This example generates a random 12-character password
    pwgen -s 24 1
}

# Loop through the usernames and create the users
for username in "${usernames[@]}"; do
    # Generate a random password
    password=$(generate_password)

    # Create the user with the specified username, password, and shell
    sudo useradd -m -p $(openssl passwd -1 "$password") -s /usr/sbin/nologin "$username"

    # Display the username and password
    echo "User: $username, Password: $password"

    # Optional: Save the usernames and passwords to a file for reference
    # This is useful if you want to keep a record of the generated usernames and passwords
    echo "User: $username, Password: $password" >> user_passwords.txt

done
echo "User creation completed."
echo "########################"
cat user_passwords.txt
echo "########################"
