#!/bin/bash

# To get Ansible for Rocky Linux 9, first ensure that the Rocky Linux 9 EPEL repository is installed using 
sudo dnf install epel-release
# Once the repository is installed, install Ansible:
sudo dnf install -y ansible
echo "Ansible has been installed!!"