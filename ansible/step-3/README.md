# Ansible Tutorial

## Step 3: Roles

### 1. Define the simplest mode of `Role` and use it inside a `Playbook`

#### Create a folder named (exactly) `roles`
#### Create a sub folder in roles and name it with desired name. here is `install-tools`
#### Create these sub folders in `install-tools`, with these names (exactly): `tasks`  `defaults`  `handlers`  `templates`
#### Create an `main.yml` file in each sub folder


### 2. Write some `task` inside the `main.yml` file in tasks folder to execute with playbook
### 3. Add the role folder name (`install-tools`) as a role to the playbook.
### 4. Run the playbook as before:
```sh
ansible-playbook ./playbooks/install-tools.yml 
```