output "layer_nlp_arn" {
  value = aws_lambda_layer_version.layer_nlp.arn
}

output "s3_lambda_layers_arn" {
  description = "value"
  value       = aws_s3_bucket.s3_lambda_layers.arn
}
