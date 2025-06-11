#!/bin/bash
cd ansible

# Read IP
IP=$(cat host_ip.txt)

# Run Ansible playbook
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i "${IP}," playbook.yml
if [ $? -ne 0 ]; then
    echo "Ansible playbook execution failed."
    exit 1
fi
echo "Ansible playbook executed successfully."