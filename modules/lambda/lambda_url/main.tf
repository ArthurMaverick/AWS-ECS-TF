resource "aws_lambda_function_url" "lambda_url" {
  function_name      = var.lambda_function_arn
  authorization_type = "AWS_IAM"
  # qualifier          = "my_alias"

  cors {
    allow_credentials = true
    allow_origins     = var.cors.allow_origins
    allow_methods     = var.cors.allow_methods
    allow_headers     = var.cors.allow_headers
    expose_headers    = var.cors.expose_headers
    max_age           = var.cors.max_age
  }
}