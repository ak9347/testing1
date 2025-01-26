#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update -y

# Install required dependencies (curl, unzip, python3)
echo "Installing dependencies..."
sudo apt install -y curl unzip python3

# Download AWS CLI version 2
echo "Downloading AWS CLI v2..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the downloaded file
echo "Unzipping AWS CLI..."
unzip awscliv2.zip

# Install AWS CLI
echo "Installing AWS CLI..."
sudo ./aws/install

# Verify the installation
echo "Verifying AWS CLI installation..."
aws --version

# Clean up
echo "Cleaning up installation files..."
rm -rf awscliv2.zip aws/

echo "AWS CLI installation completed successfully!"