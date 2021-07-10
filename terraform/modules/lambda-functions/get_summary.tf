# AWSLambda
data "archive_file" "zip_lambda_function_get_summary" {
  type        = "zip"
  source_file = "${path.root}/../functions/nlp/get_summary/handler.py"
  output_path = "${path.root}/../functions/nlp/get_summary/handler.zip"

  depends_on = ["null_resource.get_summary_buildstep"]
}

resource "null_resource" "get_summary_buildstep" {
  triggers {
    handler      = base64sha256(file("${path.root}/../functions/nlp/get_summary/handler.py"))
    requirements = base64sha256(file("${path.root}/../functions/nlp/get_summary/requirements.txt"))
    build        = base64sha256(file("${path.root}/../functions/nlp/get_summary/build.sh"))
  }

  provisioner "local-exec" {
    command = "${path.root}/../functions/nlp/get_summary/build.sh"
  }
}


resource "aws_lambda_function" "lambda_get_summary" {
  filename         = data.archive_file.zip_lambda_function_get_summary.output_path
  source_code_hash = data.archive_file.zip_lambda_function_get_summary.output_base64sha256
  function_name    = "lambda_get_summary_${var.env}"
  role             = var.lambda_execute_role_arn
  handler          = "handler.lambda_handler"
  runtime          = "python3.8"
}

# CloudWatch
resource "aws_cloudwatch_log_group" "lambda_get_summary_log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_get_summary.function_name}"

  retention_in_days = 5
}
