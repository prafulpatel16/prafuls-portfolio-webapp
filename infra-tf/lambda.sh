#!/bin/bash

# Define directories
LAMBDA_FUNCTIONS_DIR="../lambda-functions"
ZIP_OUTPUT_DIR="../infra-tf/lambda_functions/code"

# Create ZIP files for Lambda functions
#mkdir -p $ZIP_OUTPUT_DIR
zip -j "$ZIP_OUTPUT_DIR/visitorCounter.zip" "$LAMBDA_FUNCTIONS_DIR/visitorCounter.py"
zip -j "$ZIP_OUTPUT_DIR/resumeDownload.zip" "$LAMBDA_FUNCTIONS_DIR/resumeDownload.py"

echo "ZIP files created successfully."
