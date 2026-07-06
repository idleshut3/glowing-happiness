terraform {
    required_providers {
        proxmox = {
            source  = "bpg/proxmox"
            version = "0.111.0"
        }
    }
    backend "local" {
        path = "terraform.tfstate"
    }
}

provider "proxmox" {
    endpoint  = var.virtual_environment_endpoint
    api_token = var.virtual_environment_token
    insecure  = var.proxmox_insecure
    ssh {
        agent    = var.ssh_agent
        username = var.ssh_user
        # Uncomment this if using password based ssh authentication, and set var.ssh_agent to false.
        #password = var.ssh_password
    }
}