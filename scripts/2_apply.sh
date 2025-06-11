#!/bin/bash
cd terraform
terraform apply -auto-approve
if [ $? -ne 0 ]; then
    echo "Terraform apply failed."
    exit 1
fi
echo "Terraform apply completed successfully."

# Export public IP for Ansible
terraform output -raw public_ip > ../ansible/host_ip.txt
if [ $? -ne 0 ]; then
    echo "Failed to export public IP."
    exit 1
fi
echo "Public IP exported successfully to ansible/host_ip.txt."
