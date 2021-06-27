
# Role and Permissions
resource "aws_iam_role" "lambda_invoke_lambda_role" {
  name = "invoke_lambda_role"

  assume_role_policy = file("${path.module}/lambda_invoke_lambda_policy.json")
  # assume_role_policy = jsonencode({
  #   Version = "2012-10-17"
  #   Statement = [
  #     {
  #       Action = "sts:AssumeRole"
  #       Principal = {
  #         Service = "lambda.amazonaws.com"
  #       }
  #       Effect = "Allow"
  #     },
  #   ]
  # })
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
                "lambda:InvokeAsync"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_invoke_lambda_role_policy_attach" {
  role       = aws_iam_role.lambda_invoke_lambda_role.name
  policy_arn = aws_iam_policy.lambda_invoke_lambda_policy.arn
}
