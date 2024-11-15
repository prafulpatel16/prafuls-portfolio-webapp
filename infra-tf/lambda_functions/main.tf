# Define the archive files for Lambda functions
data "archive_file" "visitor_function" {
  type        = "zip"
  source_file = "${path.module}/visitorCounter.py"
  output_path = "${path.module}/code/visitorCounter.zip"
}

data "archive_file" "download_function" {
  type        = "zip"
  source_file = "${path.module}/resumeDownload.py"
  output_path = "${path.module}/code/resumeDownload.zip"
}

# Lambda function for visitor counter
resource "aws_lambda_function" "visitor_function" {
  function_name = "visitor-function"
  runtime       = "python3.9"
  handler       = "visitorCounter.lambda_handler"
  role          = var.lambda_exec_role_arn
  filename      = data.archive_file.visitor_function.output_path

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.dynamodb_table_name
    }
  }
}

# Lambda function for resume download
resource "aws_lambda_function" "download_function" {
  function_name = "download-function"
  runtime       = "python3.9"
  handler       = "resumeDownload.lambda_handler"
  role          = var.lambda_exec_role_arn
  filename      = data.archive_file.download_function.output_path

  environment {
    variables = {
      S3_BUCKET_NAME = var.s3_resume_bucket
    }
  }
}
