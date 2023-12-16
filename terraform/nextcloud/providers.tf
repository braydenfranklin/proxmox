terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.23.0"
    }
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "vault" {
  address = "http://127.0.0.1:8200"
}

data "vault_generic_secret" "proxmox_credentials" {
  path = "proxmox_secrets/proxmox_credentials"
}

provider "proxmox" {
  pm_api_url = "http://10.10.0.10:8006/api2/json"
  pm_user     = data.vault_generic_secret.proxmox_credentials.data["pm_user"]
  pm_password = data.vault_generic_secret.proxmox_credentials.data["pm_password"]
}