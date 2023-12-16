FreshRSS Setup for Proxmox LXC
=========

This Ansible role automates the deployment of FreshRSS, a self-hosted RSS feed aggregator, on Debian 12 within a Proxmox LXC (Linux Container). The role encompasses tasks for system package management, database setup with MariaDB, cloning the FreshRSS repository, and configuring Apache with necessary modules and settings. It aims to provide a seamless and secure FreshRSS deployment experience.

Requirements
------------

- Debian 12 (or compatible version) running in a Proxmox LXC container.
- Ansible 2.9 or higher on the control node.
- Ansible Vault for managing sensitive data (like the MariaDB database password).

Role Variables
--------------

There are a couple of variables used in this role, however they are not designed to be altered/set unless FreshRSS requires it due to updates to the way it installs or behaves in the future. The variables include:

- packages: List of required packages for FreshRSS setup.
- database_password: Password for the MariaDB FreshRSS user.

This role uses Ansible Vault to manage sensitive information securely, such as the MariaDB database password. The encrypted variable is stored in vars/database_password.yml. Access to the vault password is required to run the playbook. This will require creating your own vault encrypted file E.g. in the FreshRSS role directory run "ansible-vault create vars/database_password.yml"

Dependencies
------------

None. However, ensure all listed prerequisite packages are available in your APT repository. 

Example Playbook
----------------

Run the role with the base playbook located in the "playbooks" directory. It calls the FreshRSS role located in the "roles" directory. 
E.g. "ansible-playbook playbooks/freshrss.yml"
```
---
- name: Install FreshRSS on Debian 12 in Proxmox LXC
  hosts: freshrss
  become: yes
  vars_files: 
    - ../roles/freshrss/vars/database_password.yml
  roles:
    - freshrss
```

License
-------

BSD

Author Information
------------------

This role was created in 2023 by Brayden Franklin. For more information or to report issues, please visit the role's repository (https://github.com/braydenfranklin/proxmox).
