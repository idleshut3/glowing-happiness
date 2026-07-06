output "vm_ipv4_address" {
    value = proxmox_virtual_environment_vm.alma_vm.ipv4_addresses[1][0]
}