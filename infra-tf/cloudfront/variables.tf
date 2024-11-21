variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket to be used as the CloudFront origin"
  type        = string
}

variable "s3_bucket_domain_name" {
  description = "Domain name of the S3 bucket (e.g., bucket-name.s3.amazonaws.com)"
  type        = string
}

variable "default_root_object" {
  description = "The default root object for the CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "comment" {
  description = "Comment for the CloudFront distribution"
  type        = string
  default     = "CloudFront distribution for serving S3 bucket content"
}
