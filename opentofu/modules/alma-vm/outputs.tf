output "vm_info" {
    description = "Outputs for dynamic Ansible inventory."
    value = {
        vm_name         = proxmox_virtual_environment_vm.alma_vm.name
        ipv4_address    = proxmox_virtual_environment_vm.alma_vm.initialization[0].ip_config[0].ipv4[0].address
        fqdn            = "${proxmox_virtual_environment_vm.alma_vm.name}.${proxmox_virtual_environment_vm.alma_vm.initialization[0].dns[0].domain}"
        tags            = proxmox_virtual_environment_vm.alma_vm.tags
}
