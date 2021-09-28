output "lambda_container_test_function_name" {
  value = aws_lambda_function.lambda_container_test.function_name
}

output "lambda_container_test_invoke_arn" {
  value = aws_lambda_function.lambda_container_test.invoke_arn
}
