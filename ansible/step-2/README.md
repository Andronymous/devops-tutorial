# Ansible Tutorial

## Step 2: Playbooks

### 1. Define the simplest mode of `Playbook` 

#### Create a folder named (exactly) `playbooks`
#### Create an `YML` file with desired name 
The playbook file name should be a general definition of the general task we want to do.
The playbooks defines what should we do and where should it be done.


### 2. Run the playbook and check the idempotency with rerun it

```sh
ansible-playbook ./playbooks/install-tools.yml 
```
#### To get more detailed output, you can use the -v option (add more vs for increased verbosity, up to -vvvv):
```sh
ansible-playbook ./playbooks/install-tools.yml -v 
```

#### If you need to pass extra variables to your playbook, use the `--extra-vars` or `-e` flag:
```sh
ansible-playbook ./playbooks/install-tools.yml -e "var1=value1 var2=value2"
```

#### You can perform a syntax check on your playbook to ensure there are no `YAML` or `Ansible-specific syntax` errors. This does not execute any tasks; it only checks the syntax.
```sh
ansible-playbook ./playbooks/install-tools.yml --syntax-check
```

#### You can perform a `dry run` (also known as a `check mode` or "diff mode") to see what changes would be made without actually applying them. This is useful to preview the changes that will be made on the target systems.
```sh
ansible-playbook ./playbooks/install-tools.yml --check
```

#### You can list all the `tasks` in a playbook without running them. This is helpful to get an overview of what actions the playbook will perform.
```sh
ansible-playbook ./playbooks/install-tools.yml --list-tasks
```

#### Also you can list all the `hosts` that would be targeted by the playbook. This helps to ensure that your inventory and target host definitions are correct.
```sh
ansible-playbook ./playbooks/install-tools.yml --list-hosts
```
