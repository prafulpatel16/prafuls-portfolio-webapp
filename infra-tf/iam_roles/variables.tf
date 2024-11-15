variable "dynamodb_table_name" {}
variable "s3_resume_bucket" {}
variable "s3_resume_bucket_arn" {
  description = "ARN of the S3 bucket for resume storage"
  type        = string
}