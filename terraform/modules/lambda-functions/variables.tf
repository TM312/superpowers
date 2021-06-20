# General
variable "env" {
  type = string
  description = "The deployment environment name"
}

# IAM roles and permissions
variable "lambda_invoke_lambda_role_name" {
  type = string
  description = "Role name of the invoke lambda functions"
}

variable "lambda_execute_role_name" {
  type = string
  description = "Role name of the execute lambda functions"
}
