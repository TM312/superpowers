# General
variable "env" {
  type        = string
  description = "The deployment environment name"
}

variable "python_runtime" {
  type    = string
  default = "python3.8"
}

# IAM roles and permissions
variable "lambda_invoke_lambda_role_name" {
  type        = string
  description = "Role name of the invoke lambda functions"
}

variable "lambda_execute_role_name" {
  type        = string
  description = "Role name of the execute lambda functions"
}

# IAM roles and permissions
variable "lambda_invoke_lambda_role_arn" {
  type        = string
  description = "Role ARN of the invoke lambda functions"
}

variable "lambda_execute_role_arn" {
  type        = string
  description = "Role ARN of the execute lambda functions"
}

variable "layer_nlp_arn" {
  type        = string
  description = "Layer ARN of the NLP layer"
}
