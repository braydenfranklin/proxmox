Media Server Setup for Debian 12 Proxmox LXC
=========

This Ansible role is designed for installing Jellyfin, an open-source self-hosted media management and server solution, on Debian 12 within a Proxmox LXC. It includes tasks for system package updates, importing and upload of Jellyfin's GPG key and repository and the download and installation of Jellyfin. The role is designed to offer a seamless and secure installation process for Jellyfin.

Requirements
------------

- Debian 12 (or compatible version) running in a Proxmox LXC container.
- Ansible 2.9 or higher on the control node.

Role Variables
--------------

There is a single variable used in this role, however it is not designed to be altered/set unless Jellyfin requires it due to updates to the way it may install or behave in the future. The variables include:

- prerequisite_packages: A list of prerequisite packages to be installed.

Dependencies
------------

None. However, ensure all listed prerequisite packages are available in your APT repository.

Example Playbook
----------------

Run the role with the base playbook located in the "playbooks" directory. It calls the mediaserver role located in the "roles" directory. 
E.g. "ansible-playbook playbooks/mediaserver.yml"
```
---
- name: Set up a media server on Debian 12 in Proxmox LXC 
  hosts: mediaserver
  become: yes
  roles:
    - mediaserver
```

License
-------

BSD

Author Information
------------------

This role was created in 2023 by Brayden Franklin. For more information or to report issues, please visit the role's repository (https://github.com/braydenfranklin/proxmox).
