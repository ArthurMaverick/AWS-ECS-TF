resource "aws_lambda_function" "function" {
  filename      = var.filename
  function_name = var.environment
  handler       = var.handler
  role          = var.iam_for_lambda_arn
  timeout       = var.timeout
  runtime       = var.runtime     // nodejs | java | python | go | dotnetcore | ruby | provided
  memory_size   = var.memory_size // 128 | 256 | 512 | 1024 | 2048 | 3072 | 4096 | 8192 | 16384

  environment {
    variables = {
      "ENVIRONMENT" = var.environment
    }
  }
}

