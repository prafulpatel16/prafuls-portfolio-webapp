
## AWS Serverless - Profile application

# Project Documentation: Resume Download and Visitor Counter with AWS Serverless Architecture



Frontend:

HTML/CSS/JavaScript: For building the website structure and interactivity.

Bootstrap: For responsive design and styling.

Google Fonts: For custom fonts.

JavaScript Libraries:

Typed.js: For typing animation on the website.

PureCounter.js: For dynamic visitor counter on the frontend.

AOS.js: For animations on scroll.

Swiper.js: For testimonial slider functionality.

Backend:

AWS Lambda: For serverless functions that handle resume downloads and visitor counting.

AWS API Gateway: For exposing API endpoints for the Lambda functions.

AWS DynamoDB: For storing visitor counts and incrementing them for each visit.

AWS S3: For storing the resume PDF file that users can download.

Cloud Infrastructure & Security:

AWS IAM: For managing roles and policies to secure Lambda access to S3 and DynamoDB.

AWS CloudWatch: For logging and monitoring Lambda functions.

AWS WAF (optional): For protecting the API Gateway endpoints (not implemented but recommended).

Version Control & Project Management:

Git: For version control.

GitHub: For hosting and collaboration on the project.

Scripting:

Python: Used in Lambda functions to handle resume downloads and visitor counter logic.

Boto3: Python SDK to interact with AWS services (S3, DynamoDB, etc.).

Deployment & Hosting:

AWS Free Tier: Keeping costs within the AWS Free Tier by leveraging free-tier limits on Lambda, API Gateway, S3, and DynamoDB.

Table of Contents

Introduction

Project Structure

System Design Overview

Infrastructure Setup

IAM Role Setup

Lambda Function Setup

API Gateway Setup

Resume Download Functionality

Implementation Overview

S3 Configuration

API Gateway-Lambda Integration for Resume Download

Visitor Counter Functionality

Implementation Overview

DynamoDB Configuration

API Gateway-Lambda Integration for Visitor Counter

Security Measures

Budget Considerations

Deployment Diagram

Final Testing & Validation

1. Introduction

This project demonstrates how to build a serverless web application with a Resume Download Functionality and Visitor Counter using AWS services. The primary focus is on leveraging API Gateway, Lambda Functions, S3, DynamoDB, and IAM roles. This system ensures that the infrastructure operates efficiently within the AWS Free Tier limits and maintains a budget of $10/month for all AWS resources.

2. Project Structure

/project-root
    ├── /forms
    │   └── insert.php (for contact form)
    ├── /assets
    │   ├── /css (for stylesheets)
    │   ├── /img (for images, including the resume)
    │   └── /js (for JavaScript)
    ├── index.php (Main Website)
    └── README.md (Project Documentation)