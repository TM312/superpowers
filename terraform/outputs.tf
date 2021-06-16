output "base_url" {
  value = aws_api_gateway_deployment.test_deployment.invoke_url
}
