# AWSLambda
data "archive_file" "zip_lambda_function_get_summary" {
  type        = "zip"
  source_file = "${path.root}/../functions/nlp/get_summary.py"
  output_path = "${path.root}/../functions/nlp/get_summary.zip"
}


resource "aws_lambda_function" "lambda_get_summary" {
  filename         = data.archive_file.zip_lambda_function_get_summary.output_path
  source_code_hash = data.archive_file.zip_lambda_function_get_summary.output_base64sha256
  function_name    = "lambda_get_summary_${var.env}"
  layers = [var.layer_nlp_arn]
  role             = var.lambda_execute_role_arn
  handler          = "handler.lambda_handler"
  runtime          = "python3.8"

  depends_on = [
    aws_cloudwatch_log_group.lambda_get_summary_log_group,
  ]
}

# CloudWatch
resource "aws_cloudwatch_log_group" "lambda_get_summary_log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_get_summary.function_name}"

  retention_in_days = 5
}
