#!/bin/bash
cd terraform
terraform init
if [ $? -ne 0 ]; then
    echo "Terraform initialization failed."
    exit 1
fi
echo "Terraform initialized successfully."
