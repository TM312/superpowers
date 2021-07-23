resource "aws_lambda_layer_version" "layer_nlp" {
  description         = "lambda layer to provide nlp/spacy deps"
  s3_bucket           = aws_s3_bucket.s3_lambda_layers.bucket
  s3_key              = aws_s3_bucket_object.nlp_layer.key
  layer_name          = "layer_nlp"
  compatible_runtimes = ["python3.8"]
}
