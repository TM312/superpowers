# AWSLambda
data "archive_file" "zip_lambda_function_entry" {
  type        = "zip"
  source_file = "${path.root}/../functions/entry.py"
  output_path = "${path.root}/../functions/entry.zip"
}

resource "aws_lambda_function" "lambda_entry" {
  filename         = "${path.root}/../functions/entry.zip"
  source_code_hash = data.archive_file.zip_lambda_function_entry.output_base64sha256
  function_name    = "lambda_entry_${var.env}"
  role             = var.lambda_invoke_lambda_role_arn
  handler          = "entry.lambda_handler"
  runtime          = "python3.8"

  environment = {
    variables = {
      env = var.env
    }
  }
}
