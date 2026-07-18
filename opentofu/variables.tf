variable "virtual_environment_endpoint"{
    type = string
    description = "The endpoint for the Proxmox Virtual Environment API (example: https://host:port)."
}

variable "virtual_environment_token" {
    type = string
    sensitive = true
    description = "Proxmox API token in the format: user@realm!token-id=token-secret"
}

variable "proxmox_insecure" {
    type = bool
    default = false
    description = "Skip TLS verification (set true only in lab environments)."
}

variable "ssh_agent" {
    type = bool
    default = true
    description = "Uses the ssh agent to connect to the Proxmox server with key-based authentication."
}

variable "ssh_user" {
    type = string
    sensitive = true
    description = "SSH user for Proxmox host operations. See the provider documentation for when this is needed."
}

# uncomment for ssh password
#variable "ssh_password" {
#    type = string
#    sensitive = true
#}

variable "ci_ssh_key_path" {
    type = string
    description = "Defines the path to the public key, which is added to the VM's authorized keys, and enables access to the new VM from the control node."
}


variable "proxmox_vms" {
    type = map(object({
        proxmox_node    = string
        os_type         = string
        vm_name         = string
        vm_description  = string
        vm_id           = number
        cpu_sockets     = optional(number, 1)
        cpu_cores       = optional(number, 4)
        cpu_type        = optional(string, "x86-64-v3")
        memory_mb       = optional(number, 4096)
        disk_size_gb    = optional(number, 32)
        datastore_id    = optional(string, "local-lvm")
        snippet_storage = optional(string, "local")
        bridge          = string
        ipv4_address    = string
        ipv4_gateway    = string
        dns_servers     = list(string)
        domain          = optional(string, "internal")
    }))
}