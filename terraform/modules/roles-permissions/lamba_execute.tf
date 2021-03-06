
# Role and Permissions
resource "aws_iam_role" "lambda_execute_role" {
  name = "execute_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Effect = "Allow"
      },
    ]
  })
}

resource "aws_iam_policy" "lambda_execute_policy" {
  name        = "execute_policy"
  description = "Policy for AWS Lambda to execute code"

  policy = <<EOF
{
  "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "lambda:InvokeAsync"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": "${var.s3_lambda_layers_arn}"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_execute_role_policy_attach" {
  role       = aws_iam_role.lambda_execute_role.name
  policy_arn = aws_iam_policy.lambda_execute_policy.arn
}
