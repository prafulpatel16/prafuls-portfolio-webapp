output "lambda_exec_role_arn" {
  value       = aws_iam_role.lambda_exec_role.arn
  description = "The ARN of the Lambda execution role"
}

