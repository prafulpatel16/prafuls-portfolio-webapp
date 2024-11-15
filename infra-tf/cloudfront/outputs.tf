output "cloudfront_distribution_domain_name" {
  value       = aws_cloudfront_distribution.website_distribution.domain_name
  description = "The domain name of the CloudFront distribution"
}

output "origin_access_identity_iam_arn" {
  value       = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
  description = "The IAM ARN of the CloudFront Origin Access Identity"
}
