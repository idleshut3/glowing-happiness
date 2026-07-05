data "local_file" "ssh_public_key" {
  filename = var.ci_ssh_key_path
}

resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = var.snippet_storage
  node_name    = var.proxmox_node

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: ${var.vm_name}
    fqdn: ${var.vm_name}.${var.domain}
    timezone: America/New_York
    ssh_pwauth: false
    users:
      - default
      - name: ansible
        groups:
          - sudo
        shell: /bin/bash
        lock_passwd: true
        ssh_authorized_keys:
          - ${trimspace(data.local_file.ssh_public_key.content)}
        sudo: ALL=(ALL) NOPASSWD:ALL
    package_update: true
    packages:
      - qemu-guest-agent
      - net-tools
      - curl
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
      - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "user-data-cloud-config-${var.vm_id}.yaml"
  }
}