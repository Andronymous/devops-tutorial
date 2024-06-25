# Ansible Tutorial

## Step 5: Modules-using vault 

### 1. Create vault files and use them in playbooks

#### 1-1. Create a vault password for use in `user-test.yml` playbook
```bash
ansible-vault create roles/test-user-role/vars/user.yml
```
the ansible vault program asks you a password for encrypting the file

#### 1-2. Set some secret variables in the file
```vim
---
user_name: "someuser"
user_pass: "{{ '123456789' | password_hash('sha512') }}"
user_group: "somegroup"
```

#### 1-3. You can't view the file if you run the following command
```bash
cat roles/test-user-role/vars/user.yml 
```

### 1-4. Edit the encrypted file 
```bash
ansible-vault edit roles/test-user-role/vars/user.yml
```
Enter the password for the vault to allow ansible decrypt and show the content of file for edit to you


### 1-5. View the encrypted file

```bash
ansible-vault view roles/test-user-role/vars/user.yml
```
Enter the password for the vault to allow ansible decrypt and show the content of file to you


### 1-6. Decrypt the file and use it as a normal file 

```bash
ansible-vault decrypt roles/test-user-role/vars/user.yml
```
Enter the password for the vault to allow ansible decrypt the file


### 1-7. Encrypt existing file

```bash
ansible-vault encrypt roles/test-user-role/vars/user.yml 
```
Set the password for the vault

### 1-8. chane the vault password using rekey 
```bash
ansible-vault rekey roles/test-user-role/vars/user.yml 
```
Confirm current password and Set a new password for the vault


# 2. Run the playbook with vault using `--ask-vault-pass`

### a. Run the playbook
```bash
ansible-playbook ./playbooks/user-test.yml --ask-vault-pass
```

# 3. Encrypting the vault with base64 generated password

### 3-1. Generate the base64 password file `pass_file/ansible-vault.pass`
```shell
openssl rand -base64 2048 > pass_file/ansible-vault.pass
```

### 3-2. Create vault with `pass_file/ansible-vault.pass`

```bash
ansible-vault create roles/test-user-role/vars/my_user_with_bas64_pass.yml --vault-password-file=pass_file/ansible-vault.pass
```

### 3-3. View the content of the vault with pass file 

```bash
ansible-vault view group_vars/my_user_with_bas64_pass.yml --vault-password-file=pass_file/ansible-vault.pass
```

```shell
ansible-playbook ./playbooks/user-test.yml --vault-password-file=pass_file/ansible-vault.pass
```
## do not forget to safely protect the `ansible-vault.pass` file