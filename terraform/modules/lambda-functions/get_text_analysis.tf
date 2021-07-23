# AWSLambda
data "archive_file" "zip_lambda_function_get_text_analysis" {
  type        = "zip"
  source_file = "${path.root}/../functions/nlp/get_text_analysis/handler.py"
  output_path = "${path.root}/../functions/nlp/get_text_analysis/handler.zip"

  depends_on = [null_resource.get_text_analysis_buildstep]
}



resource "aws_lambda_function" "lambda_get_text_analysis" {
  filename         = data.archive_file.zip_lambda_function_get_text_analysis.output_path
  source_code_hash = data.archive_file.zip_lambda_function_get_text_analysis.output_base64sha256
  function_name    = "lambda_get_text_analysis_${var.env}"
  role             = var.lambda_execute_role_arn
  handler          = "handler.lambda_handler"
  runtime          = "python3.8"

}

# CloudWatch
resource "aws_cloudwatch_log_group" "lambda_get_text_analysis_log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_get_text_analysis.function_name}"

  retention_in_days = 5
}
