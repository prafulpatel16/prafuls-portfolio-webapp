# 👉 AWS Project: AWS Serverless Prafuls resume download Web Application

This project leverages AWS serverless services to provide resume download functionality and a visitor counter for a portfolio website. The frontend includes various JavaScript libraries for animations and interactive components, while the backend uses AWS Lambda and DynamoDB to deliver dynamic functionalities.

## 👉 [📝 Follow my detailed Blog here ](https://praful.cloud/aws-project-aws-serverless-prafuls-resume-download-web-application)

![alt text](<images/AWS Blogs- Thumbnail 1200 X 644.gif>)

## Solution Diagram:AWS Serverless Architecture
![prafuls-portfolio-webapp/images/dyndb-1.png](images/aws-serverless-prafuls-resume-download.gif)


## Objective: To implement serverless features to the resume web app
# Resume Web Application
![alt text](images/web3.png)
![alt text](images/web4.png)
# Feature 1 - Resume Download 
![alt text](images/web5.png)

# Feature 2 - Visitors counter
![alt text](images/web6.png)



## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [System Design Overview](#system-design-overview)
- [Infrastructure Setup](#infrastructure-setup)
  - [IAM Role Setup](#iam-role-setup)
  - [Lambda Function Setup](#lambda-function-setup)
  - [API Gateway Setup](#api-gateway-setup)
- [Resume Download Functionality](#resume-download-functionality)
  - [Implementation Overview](#implementation-overview)
  - [S3 Configuration](#s3-configuration)
  - [API Gateway-Lambda Integration for Resume Download](#api-gateway-lambda-integration-for-resume-download)
- [Visitor Counter Functionality](#visitor-counter-functionality)
  - [Implementation Overview](#implementation-overview)
  - [DynamoDB Configuration](#dynamodb-configuration)
  - [API Gateway-Lambda Integration for Visitor Counter](#api-gateway-lambda-integration-for-visitor-counter)
- [Security Measures](#security-measures)
- [Budget Considerations](#budget-considerations)
- [Deployment Diagram](#deployment-diagram)
- [Final Testing & Validation](#final-testing--validation)

---

## Introduction
This project demonstrates how to build a serverless web application with a Resume Download Functionality and Visitor Counter using AWS services. The primary focus is on leveraging API Gateway, Lambda Functions, S3, DynamoDB, and IAM roles. This system ensures that the infrastructure operates efficiently within the AWS Free Tier limits and maintains a budget of $10/month for all AWS resources.


## Project Structure

### Frontend
- **HTML/CSS/JavaScript**: Basic structure and interactivity.
- **Bootstrap**: For responsive design.
- **Google Fonts**: For custom fonts.
- **JavaScript Libraries**:
  - **Typed.js**: Adds typing animations.
  - **PureCounter.js**: Implements a dynamic visitor counter.
  - **AOS.js**: Enables scroll animations.
  - **Swiper.js**: Provides a testimonial slider.

### Backend
- **AWS Lambda**: Serverless functions for handling resume downloads and visitor counting.
- **AWS API Gateway**: Exposes endpoints for Lambda functions.
- **AWS DynamoDB**: Stores visitor counts and increments with each visit.
- **AWS S3**: Stores the downloadable resume PDF file.

### Cloud Infrastructure & Security
- **AWS IAM**: Manages roles and policies for Lambda access to S3 and DynamoDB.
- **AWS CloudWatch**: Logs and monitors Lambda function execution.
- **AWS WAF (Optional)**: Provides additional security for API Gateway endpoints.

### Version Control & Project Management
- **Git**: Version control system.
- **GitHub**: Project hosting and collaboration platform.

### Scripting
- **Python**: Language for Lambda functions handling resume downloads and visitor counter logic.
- **Boto3**: AWS SDK for Python, used to interact with AWS services (S3, DynamoDB).

### Deployment & Hosting
- **AWS Free Tier**: Ensures usage remains within the AWS Free Tier limits by optimizing Lambda, API Gateway, S3, and DynamoDB usage.

## System Design Overview
The architecture is designed to provide serverless, scalable, and cost-effective functionality. It uses Lambda for backend logic, API Gateway to expose endpoints, and DynamoDB for storage.

## System Architecture

-  The architecture consists of:

-  Frontend: A simple HTML/Bootstrap-based web page hosted via a static site generator (e.g., AWS S3 or EC2).

-  Backend Services: Lambda functions that handle:

-  Resume Download: Fetching the resume from an S3 bucket and allowing the user to download it.

-  Visitor Counter: Logging visits in a DynamoDB table and returning the visitor count.

## Core AWS Services Used:

- S3: Stores the resume PDF.

- Lambda: Handles the backend logic (fetching the resume and tracking visitor count).

- API Gateway: Exposes API endpoints for Lambda functions.

- DynamoDB: Stores visitor count.

- IAM Roles: Manages access permissions.


## Infrastructure Setup

### IAM Role Setup
1. Create an IAM role for Lambda functions with permissions for:
   - S3 (for resume storage)
   - DynamoDB (for visitor counter)
   - AmazonS3ReadOnlyAccess: Allows Lambda to read from the S3 bucket.

   - AmazonDynamoDBFullAccess: Allows Lambda to interact with DynamoDB.

   - AWSLambdaBasicExecutionRole: Grants Lambda access to CloudWatch for logs.

2. Attach policies for specific actions on the S3 bucket and DynamoDB table.

![alt text](images/s3-1.png)


### Lambda Function Setup
1. **Resume Download Function**: Allows users to download the resume PDF from S3.
2. **Visitor Counter Function**: Increments a visitor count in DynamoDB and retrieves the updated count.

### API Gateway Setup
1. Configure REST API endpoints for both Lambda functions.
2. Set up integrations with Lambda functions, using path-based routing for `resume/download` and `visitor/count`.

## Resume Download Functionality

### Implementation Overview
This functionality enables users to download the resume PDF from an S3 bucket via an API Gateway endpoint.

### S3 bucket Configuration to store the resume pdf files
1. Create an S3 bucket to store the resume file.
2. Upload the resume PDF with appropriate permissions for Lambda access.

![alt text](images/s3-2.png)

### S3 bucket to upload a code and host a static webapp

![alt text](images/s3-3.png)

![alt text](images/s3-4.png)

Static webapp URL: 

### Lambda Function Setup
- Steps to Create Lambda Function for Resume Download:

- Create Lambda Function:

- Go to AWS Lambda and click "Create Function."

- Choose the "Author from scratch" option.

- ame the function ResumeDownloadFunction.

- Choose the runtime (Python 3.9 or Node.js as per your choice).

- Set the IAM role to the one you created (Lambda-Resume-Download-Role).

# Lambda Function: Resume Download Handler

This Lambda function downloads a resume PDF from an S3 bucket and returns it as a binary stream for download.
- Set Environment Variables:

- S3_BUCKET_NAME: Your S3 bucket name.

- RESUME_KEY: The key (path) to your resume PDF file in S3.

![alt text](images/lambda-1.png)

![alt text](images/lambda-2.png)

- Steps to Create Lambda Function for Visitor Counter:

### API Gateway-Lambda Integration for Resume Download
1. Set up an API Gateway endpoint `/resume/download`.
2. Integrate this endpoint with the Lambda function responsible for fetching the resume file from S3.
![alt text](images/APIgt-1.png)

## Visitor Counter Functionality
![alt text](images/APIgt-1.png)


### Implementation Overview
This feature tracks the number of visitors to the site by incrementing a count stored in DynamoDB.

### DynamoDB Configuration
1. Create a DynamoDB table with a primary key for storing the visitor count.
2. Use an `UpdateItem` operation in the Lambda function to increment the count on each visit.

- Create a DynamoDB Table:

- Go to DynamoDB in the AWS Console.

- Create a table called VisitorCounter.

- Set id as the partition key.

- Prepopulate the table with an item:
![alt text](images/dyndb-1.png)
![alt text](images/dyndb-2.png)

### API Gateway-Lambda Integration for Visitor Counter
1. Set up an API Gateway endpoint `/visitor/count`.
2. Integrate this endpoint with the Lambda function that updates and retrieves the visitor count.

## Security Measures
1. **IAM Roles**: Grant limited permissions to Lambda functions.
2. **API Gateway Authorization**: Set up authorization if needed for additional security.
3. **CloudWatch Monitoring**: Track Lambda execution logs, errors, and metrics.
4. **AWS WAF (Optional)**: Apply a Web Application Firewall to API Gateway endpoints for added protection against web-based attacks.

## Budget Considerations
- By leveraging the **AWS Free Tier**, costs can be minimized with free usage allowances for Lambda, API Gateway, S3, and DynamoDB.
- Monitor AWS usage to ensure operations remain within free-tier limits.

## Deployment Diagram
Here is an overview of the architecture deployment:

- **Frontend**: HTML/CSS/JavaScript on S3 and CloudFront (for caching).
- **API Gateway**: Connects frontend with backend Lambda functions.
- **Lambda Functions**: Handles backend logic.
- **DynamoDB**: Stores visitor count.
- **S3**: Stores resume files.

## Final Testing & Validation
1. Test the resume download functionality by hitting the `/resume/download` endpoint.

![alt text](images/web1.png)
![alt text](images/web2.png)
![alt text](images/web8.png)

# Verify that the downloaded resume pdf opened successfully
![alt text](images/web10.png)

2. Test the visitor counter functionality by hitting the `/visitor/count` endpoint.

![alt text](images/web9.png)

3. Monitor CloudWatch logs for any errors or performance issues.

The /visitCount endpoint calls the Lambda function, which increments and returns the updated visitor count.

---


**Developed by Praful Patel**  
[🔗 GitHub Project Repo Link](https://github.com/prafulpatel16/prafuls-portfolio-webapp)


### Resume Section: Projects
# AWS Serverless Resume Web Application
Description: Developed a serverless web application leveraging AWS services to provide resume download functionality and a visitor counter for tracking engagement on a portfolio website. Designed for scalability, cost-effectiveness, and operational efficiency using Terraform for Infrastructure as Code (IaC) automation.

# Key Responsibilities and Contributions:

- Architected Serverless Solution: Designed a serverless architecture using AWS Lambda, API Gateway, S3, and DynamoDB, ensuring high availability, automatic scaling, and efficient resource utilization.

- Implemented Infrastructure as Code (IaC): Automated deployment with Terraform, improving consistency, reducing manual setup time, and facilitating reproducible environments for deployment.

- Resume Download Functionality: Configured an S3 bucket to store the resume PDF, making it accessible via a Lambda function triggered by API Gateway, enhancing user experience with real-time download capability.

- Visitor Counter with DynamoDB: Established a visitor counter using DynamoDB to track site traffic. Developed Lambda logic to increment and retrieve visitor counts, enabling dynamic visitor statistics on the site.

- API Gateway Integration: Set up RESTful endpoints via AWS API Gateway to expose Lambda functions, enabling secure access to backend services and improving application reliability and performance.

- Managed IAM Security: Created secure IAM roles and policies to restrict Lambda access to only necessary resources (S3 and DynamoDB), ensuring application security and adherence to least-privilege principles.

- Monitoring & Logging: Integrated CloudWatch for monitoring and logging Lambda functions, identifying performance bottlenecks, and tracking API usage to improve application reliability.

## Key Duties:

- Deployed Serverless Web Application on AWS: Designed and implemented a portfolio web application with resume download and visitor counter functionalities, using AWS serverless services and ensuring seamless user interactions.

- Automated Infrastructure with Terraform: Wrote Terraform scripts to manage AWS resources, creating a fully automated and version-controlled infrastructure deployment pipeline.

- Developed REST APIs with API Gateway and Lambda: Configured API Gateway endpoints integrated with Lambda for delivering fast, cost-effective backend responses without server maintenance.

- Optimized Security and Resource Access: Defined IAM roles and policies to enforce least-privilege access, securing interactions between Lambda, S3, and DynamoDB.

- Monitored and Enhanced Application Performance: Set up CloudWatch logging and metrics for Lambda functions to analyze usage patterns, optimize API responses, and ensure resource cost efficiency.


## Technical Skills 
- AWS: Lambda, API Gateway, S3, DynamoDB, IAM, CloudWatch
- Infrastructure as Code (IaC): Terraform
- Languages: Python (Lambda functions), HCL (Terraform scripting)
- APIs: REST API development and integration with AWS services



## Troubleshooting

# Terraform Errors resolution

![alt text](images/tf1.png)


Updated Terraform Code (If Private Access is Needed)
If you do not need public access, modify the s3_static_website/main.tf to remove the aws_s3_bucket_acl and aws_s3_bucket_policy resources:

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.website_bucket
  acl    = "private"   # Ensure the ACL is private
  # Remove the `aws_s3_bucket_acl` and `aws_s3_bucket_policy` blocks
}


# -----------------------------------------------------------------------------------------

# SAM Deployment 

Following folder contains all the SAM deployment config content along with lambda functions and static web app files
- cd prafuls-webapp

# SAM Build and Deployment Documentation
## Introduction
- This document provides a step-by-step guide to configure, build, and deploy the Serverless Application Model (SAM) project. The project includes:

- Static website hosted on S3
- Visitor counter and resume download Lambda functions
- API Gateway for routing
- DynamoDB for visitor counter
- CloudFormation for managing resources

## Prerequisites
Before you begin, ensure the following are installed and configured:

### AWS CLI:

- Install the AWS CLI from here.
- Configure the CLI
 
 aws configure

### AWS SAM CLI:

- Install the AWS SAM CLI from here.
- Verify the installation:

sam --version

### Python:

- Install Python 3.8 (specific to this project).
- Verify the installation:

python3.8 --version

# Project Structure

![alt text](images/sam1.png)


## Key Components:
- visitorCounter/: Lambda function to track and return visitor counts.
- resumeDownload/: Lambda function to allow resume downloads.
- static-site/: Static website content for hosting.
- template.yaml: SAM template to define resources and infrastructure.
- Makefile: Simplifies build, deploy, and static upload tasks.


# Step 1: Configure the SAM Template
  The template.yaml defines all the resources:

- S3 buckets for static web hosting and resume storage.
- Lambda functions for visitor count and resume download.
- DynamoDB table for visitor data.
- API Gateway for routing requests.
- Ensure the following configurations are correct:

- Bucket names use !Sub "${AWS::StackName}-[bucket-name]".
- Lambda environment variables like DYNAMODB_TABLE_NAME and RESUME_BUCKET_NAME.


# Step 2: Install Dependencies
Navigate to each Lambda function directory (visitorCounter and resumeDownload) and create a requirements.txt file with the required Python libraries.


- For example: visitorCounter/requirements.txt:

boto3


- Run the following commands to install dependencies:

pip install -r visitorCounter/requirements.txt -t visitorCounter/
pip install -r resumeDownload/requirements.txt -t resumeDownload/

# Step 3: Build the SAM Application
To build the SAM application, run:

sam build


What Happens During sam build?
The SAM CLI packages dependencies for the Lambda functions.
The build artifacts are stored in the .aws-sam/build/ directory.

# Step 4: Deploy the Application
Run the following command to deploy the application:

sam deploy --guided

### Key Deployment Prompts:
- Stack Name: Enter the CloudFormation stack name (e.g., prafuls-webapp).
- AWS Region: Specify the region (e.g., us-east-1).
- Allow SAM CLI IAM Role Creation: Choose y to allow.
- Save Arguments to Config File: Choose y to save to samconfig.toml.
- The deployment process:

Packages the application.
Uploads it to an S3 bucket managed by SAM.
Deploys the stack using CloudFormation.


# Step 5: Upload Static Web Content

After deploying the application, retrieve the S3 bucket name for static content:


aws cloudformation describe-stacks --stack-name prafuls-webapp --query "Stacks[0].Outputs[?OutputKey=='StaticWebsiteBucketName'].OutputValue" --output text

- Use the bucket name to upload the static site:

aws s3 sync static-site/ s3://[Bucket-Name]


# Step 6: Verify the Deployment

Check the CloudFormation outputs to get the URLs:

aws cloudformation describe-stacks --stack-name prafuls-webapp --query "Stacks[0].Outputs"

Key Outputs:

StaticSiteURL: URL for the hosted website.
VisitorCounterApiURL: Endpoint for visitor counter API.
ResumeDownloadApiURL: Endpoint for resume download API.


# Step 7: Automate with Makefile


Use the provided Makefile to automate the process:


S3_BUCKET=$(shell aws cloudformation describe-stacks --stack-name prafuls-webapp --query "Stacks[0].Outputs[?OutputKey=='StaticWebsiteBucketName'].OutputValue" --output text)
BUILD_DIR=static-site

.PHONY: build deploy upload-static

build:
	sam build

deploy: build
	sam deploy

upload-static:
	@if [ -z "$(S3_BUCKET)" ]; then \
		echo "Error: S3_BUCKET is not set."; \
		exit 1; \
	fi
	aws s3 sync $(BUILD_DIR) s3://$(S3_BUCKET) --delete



Run the following commands:

1. Build
make build

![alt text](images/make1.png)
![alt text](images/make2.png)

2. Deploy 
make deploy
![alt text](images/make3.png)

3. Upload Static content
make upload-static


### Troubleshooting
- Permission Issues: Ensure the IAM user or role has the necessary permissions for S3, Lambda, and CloudFormation.

- AccessControlListNotSupported Error: Remove --acl public-read and use bucket policies for public access.

- Python Errors: Ensure python3.8 is installed and available in the PATH.


Bucket Policy:
aws s3api put-public-access-block \
    --bucket prafuls-webapp-s3staticwebapp \
    --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false











# ---------------------------------#

## 👉 [📝 Follow my detailed Blog here ](https://praful.cloud/aws-project-aws-serverless-prafuls-resume-download-web-application)


## 🌐 Follow my Cloud/DevOps Tech Content and Connect

- [🌐 Website](https://www.praful.cloud)
- [💼 LinkedIn](https://linkedin.com/in/prafulpatel16)
- [🐙 GitHub](https://github.com/prafulpatel16/prafulpatel16)
- [📺 YouTube](https://www.youtube.com/@prafulpatel16)
- [✍️ Medium](https://medium.com/@prafulpatel16)
- [📝 Dev.to](https://dev.to/prafulpatel16)
