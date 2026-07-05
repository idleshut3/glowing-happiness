terraform {
    required_providers {
        proxmox = {
            source  = "bpg/proxmox"
            version = "0.111.0"
        }
    }
}

###########################################################

resource "proxmox_virtual_environment_vm" "alma_vm" {
    name        = var.vm_name
    node_name   = var.proxmox_node
    vm_id       = var.vm_id
    description = var.vm_description

    bios        = var.bios
    machine     = var.machine

    agent {
        enabled = true
    }

    cpu {
        sockets = var.cpu_sockets
        cores   = var.cpu_cores
        type    = var.cpu_type
    }

    memory {
        dedicated   = var.memory_mb
        floating    = var.memory_mb   
    }

    disk {
        datastore_id    = var.datastore_id
        import_from     = proxmox_download_file.alma_cloud_image.id
        interface       = "virtio0"
        iothread        = true
        discard         = "on"
        size            = var.disk_size_gb
    }

    efi_disk {
        datastore_id = var.datastore_id
    }

    serial_device {
        device = "socket"
    }

    vga {
        type = "serial0"
    }

    initialization {

        dns {
            servers = var.dns_servers
            domain = var.domain
        }

        ip_config{
            ipv4 {
                address = var.ipv4_address
                gateway = var.ipv4_gateway
            }
        }
        
        user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id

    }

    network_device {
        bridge  = var.bridge
        model   = "virtio"
    }
}

resource "proxmox_download_file" "alma_cloud_image" {
    content_type    = "import"
    datastore_id    = var.image_storage
    node_name       = var.proxmox_node
    url             = "https://repo.almalinux.org/almalinux/10/cloud/x86_64_v2/images/AlmaLinux-10-GenericCloud-ext4-10.2-20260526.0.x86_64_v2.qcow2"
    file_name       = "AlmaLinux-10-GenericCloud-ext4-10.2-20260526.0.x86_64_v2.qcow2"
}
