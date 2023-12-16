Linkstack Setup for Proxmox LXC
=========

This Ansible role is designed for deploying Linkstack, a self-hosted open-source Linktree alternative with an intuitive, easy to use user interface, on Debian 12 within a Proxmox LXC environment. The role includes tasks for system package management ensuring a smooth and secure deployment of Linkstack.

Requirements
------------

- Debian 12 (or compatible version) running in a Proxmox LXC container.
- Ansible 2.9 or higher on the control node.

Role Variables
--------------

There is one variable used in this role, however they are not designed to be altered/set unless Linkstack requires it due to updates to the way it installs or behaves in the future. The variables include:

- packages: List of required packages for Linkstack setup.

Dependencies
------------

None. However, ensure all listed prerequisite packages are available in your APT repository.

Example Playbook
----------------

Run the role with the base playbook located in the "playbooks" directory. It calls the Linkstack role located in the "roles" directory. 
E.g. "ansible-playbook playbooks/linkstack.yml"
```
---
- name: Install Linkstack on Debian 12 in Proxmox LXC 
  hosts: linkstack
  become: yes
  roles:
    - linkstack
```

License
-------

BSD

Author Information
------------------

This role was created in 2023 by Brayden Franklin. For more information or to report issues, please visit the role's repository (https://github.com/braydenfranklin/proxmox).
