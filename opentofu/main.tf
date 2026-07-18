locals {
    debian_vms = {
        for k, v in var.proxmox_vms : k => v if v.os_type == "debian"
    }
    alma_vms = {
        for k, v in var.proxmox_vms : k => v if v.os_type == "alma"
    }
}


module "debian-vm" {
    source               = "./modules/debian-vm"
    ci_ssh_key_path      = var.ci_ssh_key_path
    for_each             = local.debian_vms

    proxmox_node    = each.value.proxmox_node
    vm_name         = each.value.vm_name
    vm_description  = each.value.vm_description
    vm_id           = each.value.vm_id
    cpu_sockets     = each.value.cpu_sockets
    cpu_cores       = each.value.cpu_cores
    cpu_type        = each.value.cpu_type
    memory_mb       = each.value.memory_mb
    disk_size_gb    = each.value.disk_size_gb
    datastore_id    = each.value.datastore_id
    snippet_storage = each.value.snippet_storage
    bridge          = each.value.bridge
    ipv4_address    = each.value.ipv4_address
    ipv4_gateway    = each.value.ipv4_gateway
    dns_servers     = each.value.dns_servers
    domain          = each.value.domain
}
module "alma-vm" {
    source               = "./modules/alma-vm"
    ci_ssh_key_path      = var.ci_ssh_key_path
    for_each             = local.alma_vms

    proxmox_node    = each.value.proxmox_node
    vm_name         = each.value.vm_name
    vm_description  = each.value.vm_description
    vm_id           = each.value.vm_id
    cpu_sockets     = each.value.cpu_sockets
    cpu_cores       = each.value.cpu_cores
    cpu_type        = each.value.cpu_type
    memory_mb       = each.value.memory_mb
    disk_size_gb    = each.value.disk_size_gb
    datastore_id    = each.value.datastore_id
    snippet_storage = each.value.snippet_storage
    bridge          = each.value.bridge
    ipv4_address    = each.value.ipv4_address
    ipv4_gateway    = each.value.ipv4_gateway
    dns_servers     = each.value.dns_servers
    domain          = each.value.domain
}