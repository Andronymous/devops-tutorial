# Ansible Practice 2

## Objectives:
Learn to manage remote servers using Ansible.
Create a dedicated Ansible user for secure connections.
Grant sudo access with password vaulting.
Configure Ansible for the new user and password file.
Execute a task on the remote server.

## Instructions:
1. Create an Ansible Host File

2. Initial Server Login (Temporary):
   Use ansible command to login to the server with a temporary password

3. Create an Ansible User
   use a vault file for user and its password and also use a .pass file for using for vault decryption

4. Grant Sudo Access with Password Vault:
   Edit the sudoers file.

5. Configure Ansible for New User:
   a) Ansible Configuration File (ansible.cfg)
   b) Ansible Host File

6. Verify Ansible Connection with ping
 
7. switch the user to root user using the password

8. Execute a Task which needs a root privileges

By completing these steps, you'll have a secure Ansible environment with user management, password vaulting, and the ability to execute tasks on the remote server.