S3_BUCKET=$(shell aws cloudformation describe-stacks --stack-name prafuls-webapp --query "Stacks[0].Outputs[?OutputKey=='StaticWebsiteBucketName'].OutputValue" --output text)
BUILD_DIR=static-site

.PHONY: build deploy upload-static

# Build the SAM application
build:
	sam build

# Deploy the SAM application using samconfig.toml
deploy: build
	sam deploy

# Upload static site files to S3 bucket
upload-static:
	@if [ -z "$(S3_BUCKET)" ]; then \
		echo "Error: S3_BUCKET is not set. Ensure your CloudFormation stack has been deployed."; \
		exit 1; \
	fi
	aws s3 sync $(BUILD_DIR) s3://$(S3_BUCKET) 
