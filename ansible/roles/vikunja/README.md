Nextcloud Setup for Proxmox LXC
=========

This Ansible role is designed to automate the deployment of Vikunja, a self-hosted task management system, on Debian 12 within a Proxmox LXC (Linux Container). It encompasses tasks for system updates, database setup, Vikunja API and frontend installations, and necessary configurations for Apache and MariaDB. The role ensures a streamlined setup process, focusing on security and efficiency.

Requirements
------------

- Debian 12 (or compatible version) running in a Proxmox LXC container.
- Ansible 2.9 or higher on the control node.
- Ansible Vault for managing sensitive data (like the MariaDB database password).

Role Variables
--------------

There are a couple of variables used in this role, however they are not designed to be altered/set unless Vikunja requires it due to updates to the way it installs or behaves in the future. The variables include:

- packages: Necessary packages for Vikunja setup.
- database_password: Password for the MariaDB Vikunja user.
- vikunja_config: Configuration options for Vikunja such as language and timezone.

This role uses Ansible Vault to manage sensitive information securely, such as the MariaDB database password. The encrypted variable is stored in vars/database_password.yml. Access to the vault password is required to run the playbook. This will require creating your own vault encrypted file E.g. in the Nextcloud role directory run "ansible-vault create vars/database_password.yml"

Dependencies
------------

None. However, ensure all listed prerequisite packages are available in your APT repository.

Example Playbook
----------------

Run the role with the base playbook located in the "playbooks" directory. It calls the Vikunja role located in the "roles" directory. 
E.g. "ansible-playbook playbooks/vikunja.yml"
```
---
- name: Install Vikunja on Debian 12 in Proxmox LXC 
  hosts: vikunja
  become: yes
  vars_files: ../roles/vikunja/vars/database_password.yml
  roles:
    - vikunja
```

License
-------

BSD

Author Information
------------------

This role was created in 2023 by Brayden Franklin. For more information or to report issues, please visit the role's repository (https://github.com/braydenfranklin/proxmox).
