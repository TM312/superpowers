data "archive_file" "zip_lambda_layer_nlp" {
  type        = "zip"
  source_dir  = "${path.root}/modules/lambda-layers/nlp/"
  output_path = "${path.root}/modules/lambda-layers/packages/nlp.zip"
}


resource "aws_lambda_layer_version" "layer_nlp" {
  description = "lambda layer to provide nlp/spacy deps"
  filename    = data.archive_file.zip_lambda_layer_nlp.output_path
  layer_name  = "layer_nlp"

  compatible_runtimes = ["python3.8"]
}
