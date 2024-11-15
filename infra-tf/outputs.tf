output "website_bucket_url" {
  value = module.s3_static_website.website_bucket_url
}

output "resume_bucket" {
  value = module.s3_static_website.resume_bucket
}

output "api_gateway_url" {
  value = module.api_gateway.api_gateway_url
}
output "lambda_exec_role_arn" {
  value = module.iam_roles.lambda_exec_role_arn
}
output "cloudfront_url" {
  value = module.cloudfront_distribution.cloudfront_distribution_domain_name
  description = "CloudFront URL to access the static website"
}