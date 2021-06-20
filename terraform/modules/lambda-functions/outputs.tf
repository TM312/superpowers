output "lambda_entry_function_name" {
  value = aws_lambda_function.lambda_entry.function_name
}

output "lambda_entry_invoke_arn" {
  value = aws_lambda_function.lambda_entry.invoke_arn
}
