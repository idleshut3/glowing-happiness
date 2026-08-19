## Ansible Roadmap and To Do

At the current stage of this project, I am finishing up this oscap role, which is to be applied immediately to new VMs provisioned with OpenTofu. This is to be utilized before the VM is modified in any way, since it performs automated remediation in addition to compliance scanning. 

I'm debating whether to split this role into two, one for scanning and one for remediation, in order to run regularly scheduled scans on the infrastructure later on. For now, it's not the top priority, but I'll probably do it further down the line.

### To Do

There are still a few issues with this role, one being the ``--skip-rule`` parameter. The last time I used the role, it was being ignored by Alma Linux machines, but worked fine with Debian. Still need to test this further and determine the cause. 

The second issue is with the Debian datastream file, used by openscap. The Debian 12 image I am using does not include the Debian 12 CIS benchmark by default in its ``ssg-debian`` package. Therefore, I will need to add a step in order to download or copy the benchmark to the machine before running the scan and remediation. Initially I wanted to use the oscap-ssh package for this, as it eliminates the need for the ssg files to be on the target machine. Unfortunately, it does not seem to be usable for this case.

Third, I also need to look into a way to track whether a machine has already had remediation applied, so they aren't accidentally skipped or applied again. Both of those outcomes would be problematic. However, I don't think this will be too challenging to solve.

### Roadmap

The next roles I'll be writing are:

- Bind DNS 
    - Installation and basic configuration should be pretty straightforward. Still need to do some reading on TSIG keys and DNSSEC though.
- Gitea
    - The basic installation shouldn't be too difficult. However, I still need to read more about the different configuration options, and how to implement them in an Ansible role. I also plan to start running Gitea with a self signed cert to start. Once it's set up as the source of truth for the project, I'll continue with the root CA and OpenBao setup, and swap the self signed cert for one from OpenBao.