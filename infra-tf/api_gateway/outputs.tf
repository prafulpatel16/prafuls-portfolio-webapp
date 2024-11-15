output "api_gateway_url" {
  value = aws_api_gateway_rest_api.webapp_api.execution_arn
}
#output "lambda_download" {
#  value       = aws_lambda_function.download_function.arn
#  description = "ARN of the download Lambda function"
#}
