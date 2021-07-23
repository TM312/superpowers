resource "aws_s3_bucket" "s3_lambda_layers" {
  bucket        = "${var.project_name}-lambda-layers"
  force_destroy = true
}

# NLP package
locals {
  path_zip_lambda_layer_nlp = "${path.module}/packages/nlp.zip"
}

data "archive_file" "zip_lambda_layer_nlp" {
  type        = "zip"
  source_dir  = "${path.module}/nlp/"
  output_path = local.path_zip_lambda_layer_nlp
}

resource "aws_s3_bucket_object" "nlp_layer" {
  bucket = aws_s3_bucket.s3_lambda_layers.bucket
  key    = "nlp_layer"
  source = local.path_zip_lambda_layer_nlp

  #etag = filemd5(local.path_zip_lambda_layer_nlp)
}
