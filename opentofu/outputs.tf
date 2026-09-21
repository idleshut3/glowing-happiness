output "hosts" {
  description = "Complete VM information list for dynamic Ansible inventory"
  value = merge(
    { for k, v in module.debian_vms : k => v.vm_info },
    { for k, v in module.alma_vms : k => v.vm_info }
  )
}

