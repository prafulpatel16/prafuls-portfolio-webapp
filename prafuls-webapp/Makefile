S3_STATIC_BUCKET=$(shell aws cloudformation describe-stacks --stack-name prafuls-webapp --query "Stacks[0].Outputs[?OutputKey=='StaticWebsiteBucketName'].OutputValue" --output text)
RESUME_BUCKET=$(shell aws cloudformation describe-stacks --stack-name prafuls-webapp --query "Stacks[0].Outputs[?OutputKey=='ResumeBucketArn'].OutputValue" --output text | cut -d':' -f6)
BUILD_DIR=static-site
RESUME_FILE=sample_resume.pdf  # Update this with your resume file path

.PHONY: build deploy upload-static upload-resume upload-all

# Build the SAM application
build:
	sam build

# Deploy the SAM application using samconfig.toml
deploy: build
	sam deploy

# Upload static site files to the S3 bucket for the static website
upload-static:
	@if [ -z "$(S3_STATIC_BUCKET)" ]; then \
		echo "Error: S3_STATIC_BUCKET is not set. Ensure your CloudFormation stack has been deployed."; \
		exit 1; \
	fi
	aws s3 sync $(BUILD_DIR) s3://$(S3_STATIC_BUCKET) --delete

# Upload resume PDF to the S3 bucket for the resume
upload-resume:
	@if [ -z "$(RESUME_BUCKET)" ]; then \
		echo "Error: RESUME_BUCKET is not set. Ensure your CloudFormation stack has been deployed."; \
		exit 1; \
	fi
	aws s3 cp $(BUILD_DIR)/$(RESUME_FILE) s3://$(RESUME_BUCKET)

# Upload both static site and resume PDF
upload-all: upload-static upload-resume
