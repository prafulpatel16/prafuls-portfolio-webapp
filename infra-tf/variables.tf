variable "website_bucket" {
  description = "The name of the S3 bucket for hosting the static website."
  type        = string
}

variable "resume_bucket" {
  description = "The name of the S3 bucket for storing resume files."
  type        = string
}
variable "resume_key" {
  description = "The name of the S3 bucket for storing resume files."
  type        = string
}

variable "lambda_bucket" {
  description = "The name of the S3 bucket for storing resume files."
  type        = string
}
variable "region" {
  description = "AWS region for deploying resources"
  type        = string
  default     = "us-east-1"  # Or your specific AWS region
}

variable "account_id" {
  description = "AWS Account ID"
  type        = string
}