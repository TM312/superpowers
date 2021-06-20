
output "lambda_execute_role_name" {
  value = aws_iam_role.lambda_execute_role.name
}


output "lambda_invoke_lambda_role_name" {
  value = aws_iam_role.lambda_invoke_lambda_role.name
}
