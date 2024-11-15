#!/bin/bash
# Objective: To create a terrafrom folder strucutre inside the project
# Author: PRAFUL PATEL, www.praful.cloud
# Date: 6 Nov 2024

# Define the base directory
BASE_DIR="infra-tf"

# Navigate to the base directory
cd "$BASE_DIR" || exit

# Create main Terraform configuration files in the base directory
touch main.tf outputs.tf variables.tf provider.tf terraform.tfvars

# Function to create a module folder with necessary files

create_module() {
    local module_dir="$1"
    mkdir -p "$module_dir"
    touch "$module_dir/main.tf" "$module_dir/outputs.tf" "$module_dir/variables.tf"
}


# Create directories and files for each module
create module "s3_static_website"
mkdir -p "s3_static_website/files"
touch "s3_static_website"

create_module "dynamodb"
create_module "iam_roles"
create_module "lambda_functions"
mkdir -p "lambda_functions/code"
touch "lambda_functions/code/download_function.zip" "lambda_functions/code/visitor_counter.zip"


create_module "api_gateway"

# Print completion message
echo "Project structure created successfully in $BASE_DIR"
code .
