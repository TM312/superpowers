resource "aws_ecr_repository" "lambda_function_container_repository" {
  name                 = "lambda_function_container_repository"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
