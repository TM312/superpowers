# AWSLambda
data "archive_file" "zip_lambda_function_get_sum" {
  type        = "zip"
  source_file = "${path.root}/../functions/basic/get_sum.py"
  output_path = "${path.root}/../functions/basic/get_sum.zip"
}

resource "aws_lambda_function" "lambda_get_sum" {
  filename         = data.archive_file.zip_lambda_function_get_sum.output_path
  source_code_hash = data.archive_file.zip_lambda_function_get_sum.output_base64sha256
  function_name    = "lambda_get_sum_${var.env}"
  role             = var.lambda_execute_role_arn
  handler          = "get_sum.lambda_handler"
  runtime          = "python3.8"
}

# CloudWatch
resource "aws_cloudwatch_log_group" "lambda_get_sum_log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_get_sum.function_name}"

  retention_in_days = 5
}
