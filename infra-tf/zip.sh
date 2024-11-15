#!/bin/bash

# Define directories
LAMBDA_FUNCTIONS_DIR="../lambda-functions"
ZIP_OUTPUT_DIR="../infra-tf/lambda_functions/code"

# Create ZIP output directory if it doesn't exist
mkdir -p "$ZIP_OUTPUT_DIR"

# Define function to create ZIPs
zip_lambda() {
    local function_name="$1"
    zip -j "$ZIP_OUTPUT_DIR/${function_name}.zip" "$LAMBDA_FUNCTIONS_DIR/${function_name}.py"
}

# Create ZIPs for Lambda functions
zip_lambda "resumeDownload"
zip_lambda "visitorCounter"

echo "ZIP files created successfully."
