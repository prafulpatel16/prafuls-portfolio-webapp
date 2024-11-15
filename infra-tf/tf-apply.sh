#!/bin/bash

# Define variables for Terraform directories
TF_DIR="./"  # Path to your Terraform configuration directory
TF_CACHE_DIR="$TF_DIR/.terraform"

echo "Starting Terraform cache cleanup and apply process..."

# Step 1: Remove Terraform cache and lock files
if [ -d "$TF_CACHE_DIR" ]; then
    echo "Removing Terraform cache directory..."
    rm -rf "$TF_CACHE_DIR"
else
    echo "No cache directory found."
fi

if [ -f "$TF_DIR/.terraform.lock.hcl" ]; then
    echo "Removing Terraform lock file..."
    rm "$TF_DIR/.terraform.lock.hcl"
else
    echo "No lock file found."
fi

echo "Initializing Terraform..."
terraform init

# Step 2: Revalidate and plan
echo "Validating Terraform configuration..."
terraform validate

echo "Planning Terraform apply..."
terraform plan -out=tfplan

# Step 3: Apply the Terraform plan
read -p "Do you want to apply this plan? (y/n): " CONFIRM
if [ "$CONFIRM" = "y" ]; then
    echo "Applying Terraform configuration..."
    terraform apply "tfplan"
    echo "Terraform apply complete."
else
    echo "Terraform apply canceled."
fi

# Clean up the plan file
rm -f tfplan
echo "Cleanup complete. Process finished."
