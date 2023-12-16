Download Server Setup for Proxmox LXC
=========

This Ansible role is designed for setting up a comprehensive download server environment on Debian 12 within a Proxmox LXC (Linux Container). It automates various tasks including updating and upgrading system packages, installing prerequisite software, creating necessary user groups and users, managing application downloads and extraction, and configuring system and application settings. Notably, it handles the setup of Prowlarr, Radarr, Sonarr, Readarr, Jellyseerr, qBittorrent and SABnzbd applications.

Requirements
------------

- Debian 12 (or a compatible version) running in a Proxmox LXC container.
- Ansible 2.9 (or higher) on the control node.
- Sufficient privileges to install packages and manage system settings on the target hosts.

Role Variables
--------------

There are many variables used in this role however they are not designed to be altered/set unless a specific application requires it due to updates to the way they install or behave in the future. The variables include:

- prerequisite_packages: A list of prerequisite packages to be installed.
- application_groups: Groups required for the applications.
- application_users: Users required for running the applications.
- extraction_paths: Paths where applications will be extracted.
- download_details: URLs and destinations for downloading applications.
- extraction_details: Source and destination details for extracting applications.
- application_install: Installation paths and permissions for applications.
- application_configuration: Configuration paths and permissions for applications.
- apt_repositorys: Additional APT repositories to be added.
- application_packages: List of application packages to be installed.
- sabnzbdplus_config: Configuration options for SABnzbdplus.
- files: Systemd service and application configuration files to be uploaded.

Dependencies
------------

None. However, ensure all listed prerequisite packages are available in your APT repository.

Example Playbook
----------------

Run the role with the base playbook located in the "playbooks" directory. It calls the downloadserver role located in the "roles" directory. 
E.g. "ansible-playbook playbooks/downloadserver.yml"
```
---
- name: Set up a download server on Debian 12 in Proxmox LXC
  hosts: downloadserver
  become: yes
  roles:
    - downloadserver
```

License
-------

BSD

Author Information
------------------

This role was created in 2023 by Brayden Franklin. For more information or to report issues, please visit the role's repository (https://github.com/braydenfranklin/proxmox).
