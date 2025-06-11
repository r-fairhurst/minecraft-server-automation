#!/bin/bash
set -e

KEY_NAME="minecraft-key"
REGION=${AWS_REGION:-us-west-2}
KEY_FILE="${KEY_NAME}.pem"

echo "Checking if key pair '$KEY_NAME' exists in region $REGION..."

if aws ec2 describe-key-pairs --key-names "$KEY_NAME" --region "$REGION" > /dev/null 2>&1; then
  echo "Key pair '$KEY_NAME' already exists. Skipping creation."
else
  echo "Key pair '$KEY_NAME' not found. Creating key pair..."
  aws ec2 create-key-pair --key-name "$KEY_NAME" --query 'KeyMaterial' --output text --region "$REGION" > "$KEY_FILE"
  chmod 400 "$KEY_FILE"
  echo "Key pair created and saved to $KEY_FILE"
fi
