#!/bin/bash
# Define directories
LAMBDA_FUNCTIONS_DIR="../lambda-functions"
ZIP_OUTPUT_DIR="../infra-tf/lambda_functions/code"

# Ensure ZIP output directory exists
mkdir -p "$ZIP_OUTPUT_DIR"

# Create ZIP files for Lambda functions
cd "$LAMBDA_FUNCTIONS_DIR" || exit

if [ -f "visitorCounter.py" ]; then
  zip -j "$ZIP_OUTPUT_DIR/visitorCounter.zip" visitorCounter.py
else
  echo "Error: visitorCounter.py not found in $LAMBDA_FUNCTIONS_DIR"
  exit 1
fi

if [ -f "resumeDownload.py" ]; then
  zip -j "$ZIP_OUTPUT_DIR/resumeDownload.zip" resumeDownload.py
else
  echo "Error: resumeDownload.py not found in $LAMBDA_FUNCTIONS_DIR"
  exit 1
fi

# Move back to Terraform directory and apply
cd ../infra-tf || exit
terraform init
terraform apply -auto-approve
