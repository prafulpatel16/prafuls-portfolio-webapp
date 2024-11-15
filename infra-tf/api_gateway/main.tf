# Define the API Gateway REST API
resource "aws_api_gateway_rest_api" "webapp_api" {
  name = "ResumeWebAppAPI"
}

# Define the API Gateway resource for the "/resume" path
resource "aws_api_gateway_resource" "resume_resource" {
  rest_api_id = aws_api_gateway_rest_api.webapp_api.id
  parent_id   = aws_api_gateway_rest_api.webapp_api.root_resource_id
  path_part   = "resume"
}

# Define the GET method for the "/resume" resource
resource "aws_api_gateway_method" "download_method" {
  rest_api_id   = aws_api_gateway_rest_api.webapp_api.id
  resource_id   = aws_api_gateway_resource.resume_resource.id
  http_method   = "GET"
  authorization = "NONE"
}


# Define the integration of the API Gateway with the Lambda function
resource "aws_api_gateway_integration" "download_integration" {
  rest_api_id             = aws_api_gateway_rest_api.webapp_api.id
  resource_id             = aws_api_gateway_resource.resume_resource.id
  http_method             = aws_api_gateway_method.download_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_download}/invocations"

  depends_on = [aws_lambda_permission.api_gateway_permission]
}

# Define the permission for API Gateway to invoke the Lambda function
resource "aws_lambda_permission" "api_gateway_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_download
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account_id}:${aws_api_gateway_rest_api.webapp_api.id}/*/*"
}
