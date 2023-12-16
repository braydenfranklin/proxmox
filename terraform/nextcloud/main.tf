resource "proxmox_lxc" "nextcloud" {
  target_node  = "pve"
  vmid         = "1001"
  hostname     = "nextcloud"
  ostemplate   = "local:vztmpl/debian-12-standard_12.2-1_amd64.tar.zst"
  cores        = "4"
  memory       = "8192"
  swap         = "8192"
  unprivileged = true
  start        = true
  onboot       = true 

  ssh_public_keys = <<-EOT
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDP2bOJdQ/vavEIEkb/kHEKUJpxpfoI/YPwW1msgI9Zbz/f+zV3tMZbztp8e23B1EnNNRo8MgzKoJNoDvVpnJiNX8u+jnuCp1hFTCnWsHqOtGk//kTelG0ln84c/LUQZSgy2AKWkHaRk5KAgINuTApEoMdbmy7t96N7MF+Ws2XmYuEUzhkyRUq9cal6Z4eXK/mVgc7BLVhwjH33+Xl8ggL9JJXOwGUwghfgTr4s5XQBl5JpOhyRqX0cG2G1X0rguSD9NUZvPbin3clCfes5iOeOlSeObzsTq7TEL2pIywGyYV/0/62BDWATcj9Lp12QGEoIb1X9MDRFcR/RWE2wH25Donz5wOb4rjtKFU51JCIF+TREk+aax6v0nDmX9/scXH+PfzNf0gOM08q2uAjYiDCfPAodFw4HWLbKL/pUr9qQoFnMcSiUudpYv6vq4W+DqvRxXZozPazsF+hrWC/FBNEM7n7rdxpGNsCdGxUnpWQoUOQ+Q99hruFWPtIZEctfXYw+yxukTjaPCWNC3acvz9V0dqj+xgIML49g9RWf+EBa6LVwegBtqBWXShMR6WAsdjREZR5xANmQnu8Ryjrr4VOAQAcG8lcuLfy02kFCEbDsbucqhCT3fx3JK2FeU6mlFF5BPQUW6PrQBQpoYFgiBThmU+SQzSfazXGDex7Kb6tekw==
  EOT

  rootfs {
    storage = "samsung"
    size    = "4G"
  }

  mountpoint {
    key     = "0"
    slot    = 0
    storage = "samsung"
    mp      = "/mnt/data"
    size    = "40G"
    backup  = true
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "10.10.1.1/16"
    gw     = "10.10.0.1"
  }
}