output "website_bucket_url" {
  value = aws_s3_bucket_website_configuration.website_config.website_endpoint
  description = "The URL of the static website hosted in the S3 bucket"
}

output "resume_bucket" {
  value = aws_s3_bucket.resume_bucket.id
}

output "website_bucket" {
  value = aws_s3_bucket.website_bucket.id
}

output "lambda_bucket"{
  value = aws_s3_bucket.lambda_bucket.id
}
output "s3_resume_bucket_arn" {
  value       = aws_s3_bucket.resume_bucket.arn
  description = "The ARN of the resume S3 bucket"
}
output "website_bucket_arn" {
  value       = aws_s3_bucket.website_bucket.arn
  description = "The ARN of the S3 bucket configured for static website hosting."
}

output "website_bucket_domain_name" {
  value       = aws_s3_bucket.website_bucket.website_endpoint
  description = "The domain name of the S3 bucket configured for static website hosting."
}