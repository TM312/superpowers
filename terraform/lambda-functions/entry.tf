# Role and Permissions
resource "aws_iam_role" "lambda_invoke_lambda_role" {
  name = "invoke_lambda_role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "lambda.amazonaws.com"
        },
        "Effect": "Allow"
      }
    ]
  }
  EOF
}

resource "aws_iam_policy" "lambda_invoke_lambda_policy" {
  name        = "invoke_lambda_policy"
  description = "Policy for AWS Lambda to invoke other Lambda functions"

  policy = <<EOF
{
  "Version": "2012-10-17",
      "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:DescribeLogStreams",
                "logs:GetLogEvents",
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "lambda:InvokeAsync",
            ],
            "Resource": [
                "arns of all other lambda functions",
            ]
        },
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_s3_put_transcribe_role_policy_attach" {
  role       = aws_iam_role.lambda_invoke_lambda_policy.name
  policy_arn = aws_iam_policy.lambda_invoke_lambda_policy.arn
}

# AWSLambda
data "archive_file" "zip_lambda_function_entry" {
  type        = "zip"
  source_file = "../../main/lambda/entry.py"
  output_path = "../../main/lambda/entry.zip"
}

resource "aws_lambda_function" "lambda_entry" {
  filename         = "../../main/lambda/entry.zip"
  source_code_hash = data.archive_file.zip_lambda_function_entry.output_base64sha256
  function_name    = "lambda_entry_${var.env}"
  role             = aws_iam_role.lambda_invoke_lambda_policy.arn
  handler          = "entry.lambda_handler"
  runtime          = "python3.8"

  environment {
    variables = {}
  }
}
