#!/bin/bash
set -e

# Load environment variables
if [ ! -f ./env.sh ]; then
  echo "Missing env.sh file. Please create it with your AWS credentials."
  exit 1
fi

echo "Loading AWS credentials..."
source ./env.sh

# Step 0: Create or verify key pair
echo "Checking for existing key pair..."
./scripts/0_create_keypair.sh

# Step 1: Initialize Terraform
echo "Running Terraform init..."
./scripts/1_init.sh

# Step 2: Apply Terraform plan and get instance IP
echo "Applying Terraform configuration..."
./scripts/2_apply.sh

# Step 3: Run Ansible to configure the EC2 instance
echo "Running Ansible configuration..."
sleep 10
./scripts/3_configure.sh

# Step 4: Run nmap to verify Minecraft server is up
echo "Verifying Minecraft server with nmap...setup might take a minute or two, if the server is not up yet, please wait a bit longer."
sleep 70
./scripts/4_check_connection.sh
echo 

# Done
echo -e "\n✅ Your Minecraft server is up and running at: $INSTANCE_IP:25565"
