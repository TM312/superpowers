# AWSLambda
data "archive_file" "zip_lambda_function_get_round" {
  type        = "zip"
  source_file = "${path.root}/../functions/basic/get_round.py"
  output_path = "${path.root}/../functions/basic/get_round.zip"
}

resource "aws_lambda_function" "lambda_get_round" {
  filename         = data.archive_file.zip_lambda_function_get_round.output_path
  source_code_hash = data.archive_file.zip_lambda_function_get_round.output_base64sha256
  function_name    = "lambda_get_round_${var.env}"
  role             = var.lambda_execute_role_arn
  handler          = "get_round.lambda_handler"
  runtime          = "python3.8"

}

# CloudWatch
resource "aws_cloudwatch_log_group" "lambda_get_round_log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_get_round.function_name}"

  retention_in_days = 5
}
