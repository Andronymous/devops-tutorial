# Ansible Practice

## Objective:
Your task is to use Ansible to connect to a new server, configure it to be a web server, install Nginx, and serve a simple index.html page. This exercise will help you understand the basics of Ansible playbooks, tasks, and modules.

## Instructions:
1. Server Setup:
   Provide a minimal server (vm).
   Ensure you can connect to the server via SSH from your control machine. (control machine can be your pc)

2. Ansible Inventory:
   Create an Ansible inventory file (hosts) that includes the details of the new server.

3. Ansible Playbook:
   Write an Ansible playbook (setup-webserver.yml) that performs the following tasks:

### Task 1: Update all the packages on the server and ensure the server is updated.

### Task 2: Install the Nginx web server.

### Task 3: Configure nginx to serve your domain and connect it to the page

### Task 4: Create a simple index.html file that contains a welcome message.
Copy this index.html file to the default Nginx web directory (/usr/share/nginx/html).


# Using Vault
### Ansible Vault is a feature of Ansible that enables the encryption of sensitive data within Ansible projects, such as passwords, API keys, or any other confidential information. It ensures that these secrets remain secure, even when stored in version control systems or shared among team members.
Create an Encrypted File:

```sh
ansible-vault create <filename>
# This command will prompt you for a password and then open an editor to create the file.
```

Edit an Encrypted File:
```sh
ansible-vault edit <filename>
# This command allows you to modify an existing encrypted file. It will prompt you for the vault password.
```

Encrypt an Existing File:
```sh
ansible-vault encrypt <filename>
# Use this command to encrypt an unencrypted file.
```

Decrypt an Encrypted File:
```sh
ansible-vault decrypt <filename>
# This command will decrypt a file, removing the encryption and leaving it in plaintext.
```

Rekey (Change Password) for an Encrypted File:
```sh
ansible-vault rekey <filename>
# Use this command to change the password of an encrypted file.
```

View the Contents of an Encrypted File:
```sh
ansible-vault view <filename>
# If you want to view the contents of an encrypted file without decrypting it permanently, use this command
```