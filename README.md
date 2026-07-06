### Glowing-Happiness 

This project is an exploration of Infrastructure as Code, and the GitOps methodology.

---

I am certain the goals of this project will change along the way, and that's by design. Regardless, the current roadmap is below:

##### Phase 1
 
 - Deploy the bare minimum number of VMs to Proxmox with OpenTofu, to set up the base infrastructure. At minimum, this includes the Gitea VM, which will act as the source of truth. I may deploy a DNS server and internal PKI for this as well. 
 - Configure the VMs mentioned above with Ansible.
 - Deploy an OpenBao cluster as a self-hosted KMS.

##### Phase 2
 
 - Kubernetes cluster deployment
 - ArgoCD integration
 - Nautobot for network infrastructure automation
 - And more....


There are probably some things I forgot to mention here, but I will try to update the roadmap periodically. 

---
Aside from the infrastructure deployment goals of this project, I am also hoping to learn more about security best practices in automation-heavy workflows. 

To give a practical example, it would be easy for me to use local environment variables in a personal project like this. Obviously, that method doesn't scale very well, and would immediately cause issues when working with a team. However, collaborative work introduces new security considerations, such as trust, key/password management, and access controls. Therefore, I am treating this project as if it were infrastructure managed by a team, to learn about the security issues that arise and balancing security with the benefits of automation. 

In addition to the specific scenario above, I'm constantly asking questions like:
 - If an attacker got X, what would they gain, and what would the blast radius be?
 - What kind of lateral movement or privilege escalation could occur?
 - What mitigations could reduce the damage, or close the attack vector entirely?
 - What level of risk is acceptable?

These are the kinds of questions I am trying to answer throughout this project, in addition to better understanding IaC tools and GitOps workflows. I'll do my best to document these questions as they occur, and the decisions made because of them. 

---

Note - This repo is not the source of truth for this project, which will be self-hosted on Gitea. As of now, this repo serves as a  backup and a place for documentation. I'm uploading my work here in case it is useful to someone else, but I can't promise that this repo will have the same commit frequency as the Gitea repo, or follow GitOps principles as stringently. 