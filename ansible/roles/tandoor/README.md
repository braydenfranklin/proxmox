Tandoor Recipe Manager Setup for Proxmox LXC
=========

This Ansible role is designed for the installation and configuration of Tandoor Recipes, a self-hosted recipe management tool, on Debian 12 within a Proxmox LXC container. It includes tasks for system package management, PostgreSQL database setup, cloning the Tandoor repository, and configuring NGINX and Gunicorn. The role is aimed at providing an efficient and secure setup process for Tandoor Recipes.

Requirements
------------

- Debian 12 (or compatible version) running in a Proxmox LXC container.
- Ansible 2.9 or higher on the control node.
- Ansible Vault for managing sensitive data (like the PostgreSQL database password).

Role Variables
--------------

There are a few variables used in this role, however they are not designed to be altered/set unless Nextcloud requires it due to updates to the way it installs or behaves in the future. The variables include:

- packages: List of required packages for Tandoor setup.
- database_password: Password for the PostgreSQL Tandoor user.
- env_config: Environment configuration variables for Tandoor.

This role uses Ansible Vault to manage sensitive information securely, such as the PostgreSQL database password. The encrypted variable is stored in vars/database_password.yml. Access to the vault password is required to run the playbook. This will require creating your own vault encrypted file E.g. in the Tandoor role directory run "ansible-vault create vars/database_password.yml"

Dependencies
------------

None. However, ensure all listed prerequisite packages are available in your APT repository.

Example Playbook
----------------

Run the role with the base playbook located in the "playbooks" directory. It calls the NextTandoor role located in the "roles" directory. 
E.g. "ansible-playbook playbooks/tandoor.yml"
```
---
- name: Install Tandoor Recipe Manager on Debian 12 in Proxmox LXC
  hosts: tandoor
  become: yes
  vars_files: 
    - ../roles/tandoor/vars/database_password.yml
  roles:
    - tandoor
```

License
-------

BSD

Author Information
------------------

This role was created in 2023 by Brayden Franklin. For more information or to report issues, please visit the role's repository (https://github.com/braydenfranklin/proxmox).
