# Ansible Tutorial

## Step 1: Connection

### 1. Connecting the Controller Node to Managed Nodes

#### Establishing SSH Communication:
To establish communication between the controller and managed nodes, we need to use SSH keys.

### 2. Measuring Communication Accuracy with the Ping Module

We can verify the accuracy of the connection using the `ping` module:

```sh
ansible all -i ./inventory/hosts.yml -m ping --private-key=/root/.ssh/ansible_rsa
```

### 3. Gathering Facts from Managed Nodes
Next, we retrieve some facts about the servers using the `gather_facts` module:
```sh
ansible all -i ./inventory/hosts.yml -m gather_facts --private-key=/root/.ssh/ansible_rsa
```
###### * These steps utilize ad-hoc commands for immediate verification and information retrieval.


### 4. Simplifying Commands with Configuration

```cfg
[defaults]
inventory = ./inventory/hosts.yml
private_key_file = /root/.ssh/ansible_rsa
```
#### Now we can use Simplified Commands With the configuration in place as follows:

Ping Module:
```sh
ansible all -m ping
```

Gather Facts Module:
```sh 
ansible all -m gather_facts
```