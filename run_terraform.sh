#!/bin/bash

# Navigate to the infra-tf directory
cd infra-tf || {
  echo "The directory 'infra-tf' does not exist. Exiting."
  exit 1
}

# Initialize Terraform
echo "Initializing Terraform..."
terraform init
if [ $? -ne 0 ]; then
  echo "Terraform initialization failed. Exiting."
  exit 1
fi

# Run Terraform plan to preview changes
echo "Planning Terraform deployment..."
terraform plan -out=tfplan
if [ $? -ne 0 ]; then
  echo "Terraform plan failed. Exiting."
  exit 1
fi

# Apply the planned changes
echo "Applying Terraform plan..."
terraform apply tfplan
if [ $? -ne 0 ]; then
  echo "Terraform apply failed. Exiting."
  exit 1
fi

# Clean up the plan file
rm -f tfplan

echo "Terraform deployment completed successfully!"
