# CloudFront Origin Access Identity (OAI)
resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "OAI for accessing S3 bucket"
}

# CloudFront Distribution
resource "aws_cloudfront_distribution" "website_distribution" {
  origin {
    domain_name = var.s3_bucket_domain_name
    origin_id   = "S3-Origin"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.default_root_object
  comment             = var.comment

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-Origin"

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
# IAM Policy to restrict bucket access to CloudFront OAI only
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = var.s3_bucket_arn

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowCloudFrontAccessOnly",
        Effect    = "Allow",
        Principal = {
          AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
        },
        Action    = "s3:GetObject",
        Resource  = "${var.s3_bucket_arn}/*"
      }
    ]
  })
}