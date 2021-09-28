locals {
  path_to_container = "${path.root}/../functions/test_container"
  image_tag         = "1.0"
}

data "aws_ecr_image" "lambda_container_test_image" {
  depends_on      = [null_resource.ecr_image]
  repository_name = aws_ecr_repository.lambda_function_container_repository.name
  image_tag       = local.image_tag
}

resource "aws_lambda_function" "lambda_container_test" {
  depends_on = [
    null_resource.ecr_image
  ]
  function_name = "lambda_container_test_${var.env}"
  role          = var.lambda_execute_role_arn
  image_uri     = "${aws_ecr_repository.lambda_function_container_repository.repository_url}@${data.aws_ecr_image.lambda_container_test_image.id}"
  package_type  = "Image"
}

resource "null_resource" "ecr_image" {
  depends_on = [aws_ecr_repository.lambda_function_container_repository]

  triggers = {
    python_file = md5(file("${path_to_container}/index.py"))
    docker_file = md5(file("${path_to_container}/Dockerfile"))
  }

  provisioner "local-exec" {
    command     = "docker build --tag ${aws_ecr_repository.lambda_function_container_repository.repository_url}:${var.env}-${local.image_tag} ."
    working_dir = local.path_to_container
  }

  provisioner "local-exec" {
    command     = "docker push --all-tags ${aws_ecr_repository.lambda_function_container_repository.repository_url}"
    working_dir = local.path_to_container
  }
}

# CloudWatch
resource "aws_cloudwatch_log_group" "lambda_test_log_group" {
  name = "/aws/lambda/${aws_lambda_function.lambda_test.function_name}"

  retention_in_days = 5
}
