#!/bin/bash
set -e

# Load environment variables
if [ ! -f ./env.sh ]; then
  echo "Missing env.sh file. Please create it with your AWS credentials."
  exit 1
fi

echo "Loading AWS credentials..."
source ./env.sh

echo "WARNING: This will remove all your stuff."
read -p "Are you sure you want to continue? (yes/no): " CONFIRM

if [[ "$CONFIRM" != "yes" ]]; then
  echo "Destroy cancelled."
  exit 1
fi

# Destroy infrastructure
cd terraform
terraform destroy -auto-approve
cd ..

echo "YIPPEE All AWS resources have been destroyed."
