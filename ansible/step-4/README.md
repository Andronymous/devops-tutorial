# Ansible Tutorial

## Step 4: Variables

### 1. Define these most common variable and test them in the playbook:
```
Role Defaults
Inventory File Variables
Inventory Group Vars
Inventory Host Vars
Host Facts
Playbook Variables
Task Variables
Extra Variables
Role Vars
Registered Variables
```

### . Run the `test-vars.yml` playbook to test all these variablese
```sh
ansible-playbook ./playbooks/test-vars.yml -e "extra_var='this is the extra variable from command'"
```
