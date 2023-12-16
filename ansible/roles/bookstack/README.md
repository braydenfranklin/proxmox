Bookstack Setup for Proxmox LXC
=========

This Ansible role is crafted for the deployment of BookStack on Debian 12 within a Proxmox LXC environment. It handles a range of tasks from system package updates to database and user setup for BookStack, including cloning the BookStack repository and configuring Apache. The role is designed to offer a seamless and secure installation process for BookStack, ensuring proper configuration and permissions.

Requirements
------------

- Debian 12 (or compatible version) running in a Proxmox LXC container.
- Ansible 2.9 or higher on the control node.
- Ansible Vault for managing sensitive data (like the MariaDB database password).

Role Variables
--------------

There are a few variables used in this role, however they are not designed to be altered/set unless Bookstack requires it due to updates to the way it installs or behaves in the future. The variables include:

- packages: List of required packages for BookStack setup.
- database_password: Password for the MariaDB BookStack user.
- env_config: Environment configuration variables for BookStack.

This role uses Ansible Vault to manage sensitive information securely, such as the MariaDB database password. The encrypted variable is stored in vars/database_password.yml. Access to the vault password is required to run the playbook. This will require creating your own vault encrypted file E.g. in the Bookstack role directory run "ansible-vault create vars/database_password.yml"

Dependencies
------------

None. However, ensure all listed prerequisite packages are available in your APT repository.

Example Playbook
----------------

Run the role with the base playbook located in the "playbooks" directory. It calls the Bookstack role located in the "roles" directory. 
E.g. "ansible-playbook playbooks/bookstack.yml"
```
---
- name: Install Bookstack on Debian 12 in Proxmox LXC
  hosts: bookstack
  become: yes
  vars_files: 
    - ../roles/bookstack/vars/database_password.yml
  roles:
    - bookstack
```

License
-------

BSD

Author Information
------------------

This role was created in 2023 by Brayden Franklin. For more information or to report issues, please visit the role's repository (https://github.com/braydenfranklin/proxmox).
