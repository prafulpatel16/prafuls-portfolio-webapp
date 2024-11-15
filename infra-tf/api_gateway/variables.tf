variable "lambda_download" {}
variable "lambda_visitor" {}
variable "lambda_exec_role_arn" {
  type = string
  description = "ARN of the IAM role to execute the Lambda function"
}
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "account_id" {
  description = "AWS account ID for permissions"
  type        = string
}