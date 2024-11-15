# Define the Lambda execution role
resource "aws_iam_role" "lambda_exec_role" {
  name               = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Define custom policy for Lambda to access DynamoDB and S3
resource "aws_iam_policy" "lambda_policy" {
  name = "LambdaPolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["dynamodb:UpdateItem", "dynamodb:GetItem"],
        Resource = "arn:aws:dynamodb:*:*:table/${var.dynamodb_table_name}"
      },
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject"],
        Resource = "arn:aws:s3:::${var.s3_resume_bucket}/*"
      }
    ]
  })
}

# Attach the custom policy to the Lambda execution role
resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}



# Define IAM role with assume policy for Lambda (or other service as needed)
resource "aws_iam_role" "resume_bucket_access_role" {
  name               = "resume_bucket_access_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement: [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com" # Update this to the appropriate service
        }
      }
    ]
  })
}

# IAM Policy for accessing the resume S3 bucket
resource "aws_iam_policy" "resume_bucket_policy" {
  name        = "ResumeBucketAccessPolicy"
  description = "Policy to allow access to objects in the resume bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect: "Allow",
        Action: [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutBucketPolicy"
        ],
        Resource: [
          "${var.s3_resume_bucket_arn}",
          "${var.s3_resume_bucket_arn}/*"
        ]
      }
    ]
  })
}

# Attach the policy to the IAM role
resource "aws_iam_role_policy_attachment" "resume_bucket_policy_attachment" {
  role       = aws_iam_role.resume_bucket_access_role.name
  policy_arn = aws_iam_policy.resume_bucket_policy.arn
}
