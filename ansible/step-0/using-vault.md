# Ansible Tutorial

## Step 0:

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
