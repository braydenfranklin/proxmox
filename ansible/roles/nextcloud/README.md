Nextcloud Setup for Proxmox LXC
=========

This Ansible role facilitates the installation and configuration of Nextcloud on Debian 12 within a Proxmox LXC (Linux Container). It includes tasks for system package updates, Nextcloud database creation, user setup for MariaDB, downloading and extracting Nextcloud, and configuring PHP and Apache settings. The role aims to provide a seamless and secure setup process for Nextcloud, leveraging Ansible Vault for sensitive data like database passwords.

Requirements
------------

- Debian 12 (or compatible version) running in a Proxmox LXC container.
- Ansible 2.9 or higher on the control node.
- Ansible Vault for managing sensitive data (like the MariaDB database password).

Role Variables
--------------

There are a few variables used in this role, however they are not designed to be altered/set unless Nextcloud  requires it due to updates to the way it installs or behaves in the future. The variables include:

- packages: List of necessary packages for Nextcloud setup.
- database_password: MariaDB password for Nextcloud (managed via Ansible Vault).
- php_config: PHP configuration options.
- nextcloud_permissions: Permissions for Nextcloud and data directories.
- apache_modules: Apache modules to enable for Nextcloud.

This role uses Ansible Vault to manage sensitive information securely, such as the MariaDB database password. The encrypted variable is stored in vars/database_password.yml. Access to the vault password is required to run the playbook. This will require creating your own vault encrypted file E.g. in the Nextcloud role directory run "ansible-vault create vars/database_password.yml"

Dependencies
------------

None. However, ensure all listed prerequisite packages are available in your APT repository.

Example Playbook
----------------

Run the role with the base playbook located in the "playbooks" directory. It calls the Nextcloud role located in the "roles" directory. 
E.g. "ansible-playbook playbooks/nextcloud.yml"
```
---
- name: Install Nextcloud on Debian 12 in Proxmox LXC
  hosts: nextcloud
  become: yes
  vars_files: ../roles/nextcloud/vars/database_password.yml
  roles:
    - nextcloud
```

License
-------

BSD

Author Information
------------------

This role was created in 2023 by Brayden Franklin. For more information or to report issues, please visit the role's repository (https://github.com/braydenfranklin/proxmox).