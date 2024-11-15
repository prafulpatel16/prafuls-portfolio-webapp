# s3_static_website/main.tf

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.website_bucket
 # acl    = "private"   # Ensure the ACL is private

  # Enable website hosting
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

#resource "aws_s3_bucket_acl" "website_bucket_acl" {
#  bucket = aws_s3_bucket.website_bucket.id
#  acl    = "public-read"
#}

resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


# Public bucket policy to allow everyone to read objects
resource "aws_s3_bucket_policy" "website_policy" {
  bucket = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      }
    ]
  })
}

resource "null_resource" "upload_static_website" {
  provisioner "local-exec" {
    command = "aws s3 sync s3_static_website/files s3://${aws_s3_bucket.website_bucket.bucket}"
  }
}



resource "aws_s3_bucket" "resume_bucket" {
  bucket = var.resume_bucket
  acl    = "private"
}
# Upload the resume PDF file to the S3 bucket
resource "aws_s3_object" "resume_pdf" {
  bucket = aws_s3_bucket.resume_bucket.bucket
  key    = var.resume_key  # This should match your resume_key variable
  source = "${path.module}/files/sample_resume.pdf"
  acl    = "private"
}

# Lambda function storded bucket
resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.lambda_bucket
  acl    = "private"
}
