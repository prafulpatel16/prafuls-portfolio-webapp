output "visitor_lambda_arn" {
  value = aws_lambda_function.visitor_function.arn
}

# lambda_functions/outputs.tf

output "download_lambda_arn" {
  value = aws_lambda_function.download_function.arn
  description = "ARN of the download Lambda function"
}
output "download_function_path" {
  value = data.archive_file.download_function.output_path
  description = "Path to the downloaded file"
}
