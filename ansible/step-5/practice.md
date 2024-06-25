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