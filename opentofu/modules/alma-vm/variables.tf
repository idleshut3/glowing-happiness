variable "proxmox_node" {
    type = string
    description = "Name of the Proxmox node where the VM will be deployed."
}

variable "vm_name" {
    type = string
    description = "Name of the VM to be created."
}

variable "vm_description" {
    type = string
    description = "Description of the VM's purpose."
}

variable "vm_id" {
    type = number
    description = "ID of the VM to be created."
}

variable "bios" {
    type = string
    default = "ovmf"
    description = "Bios type of the VM. OVMF requires EFI storage to be defined. The alternative is seabios, which does not require EFI storage."
}

variable "machine" {
    type = string
    default = "q35"
    description = "Q35 machine type supports certain device passthrough operations. The alternative is i440fx."
}

variable "cpu_sockets" {
    type = number
    description = "Defines the number of CPU sockets for the VM. Generally 1 is recommended, see the Proxmox documentation for more info."
}

variable "cpu_cores" {
    type = number
    description = "Defines the number of CPU cores for the VM. 4 is typically a good baseline."
}

variable "cpu_type" {
    type = string
    description = "Defines the CPU type for the VM. Proxmox defaults to x86-64-v2-AES. Certain cases may require x86-64-v3 or host."
}

variable "memory_mb" {
    type = number
    description = "Defines the amount of memory in MiB (1 MiB = 1024) for the VM. 2048 or 4096 is typically a good baseline."
}

variable "disk_size_gb" {
    type = number
    description = "Defines the amount of storage in GiB for the VM. 32 is a typically a good baseline."
}

variable "datastore_id" {
    type = string
    description = "Defines the storage location of the VM's disk. On a default Proxmox installation, this is usually lvm-thin."
}
        
variable "snippet_storage" {
    type = string
    default = "local"
    description = "Defines the storage location where the cloud-init .yaml file is stored. The storage must have snippets enabled."
}

variable "image_storage" {
    type = string
    default = "local"
    description = "Defines the storage location where the cloud image will be downloaded. The storage must have imports enabled."
}

variable "bridge" {
    type = string
    description = "Defines the Proxmox bridge to be utilized by the VM's network device."
}

variable "ipv4_address" {
    type = string
    description = "Defines a static IPv4 address for the VM."
}
        
variable "ipv4_gateway" {
    type = string
    description = "Defines the gateway for the VM."
}

variable "dns_servers" {
    type = list(string)
    description = "Defines the DNS servers for the VM."
}

variable "domain" {
    type = string
    description = "Defines the domain name for the VM."
}

variable "ci_ssh_key_path" {
    type = string
    description = "Defines the path to the public key, which is added by cloud-init to the VM's authorized keys, and enables access to the new VM from the control node."
}