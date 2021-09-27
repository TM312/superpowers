# AWSLambda
module "lambda_container_test" {
  source     = "${path.root}/../functions/"
  depends_on = [null_resource.initial_image_test]

  function_name = "lambda_test_${var.env}"

  create_package = false
  image_uri      = module.docker_image_test.image_uri
  package_type   = "Image"
}

module "docker_image_test" {
  source = "${path.root}/../functions/test_container"

  create_ecr_repo = true
  ecr_repo        = aws_ecr_repository.lambda_function_container_repository.name
  image_tag       = "1.0"
}

resource "null_resource" "initial_image_test" {
  depends_on = [aws_ecr_repository.lambda_function_container_repository]

  provisioner "local-exec" {
    command     = "docker build --tag ${aws_ecr_repository.lambda_function_container_repository.repository_url}:${var.env} ."
    working_dir = "${path.root}/../functions/test_container"
  }

  provisioner "local-exec" {
    command     = "docker push --all-tags ${aws_ecr_repository.lambda_function_container_repository.repository_url}"
    working_dir = "${path.root}/../functions/test_container"
  }
}

# CloudWatch
resource "aws_cloudwatch_log_group" "lambda_test_log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_test.function_name}"

  retention_in_days = 5
}
