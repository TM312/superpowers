# IAM roles and permissions
variable "lambda_execute_role_arn" {
  type        = string
  description = "Role ARN of the execute lambda functions"
}

variable "env" {
  type        = string
  description = "The deployment environment name"
}

variable "region" {
  type        = string
  description = "AWS Region"
}
