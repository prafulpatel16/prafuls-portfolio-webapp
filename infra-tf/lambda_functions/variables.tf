variable "s3_resume_bucket" {}
variable "dynamodb_table_name" {}

variable "lambda_exec_role_arn" {
  description = "The ARN of the Lambda execution role"
  type        = string
}
