# Configure the AWS Provider

# Provider 'aws' is configured using env vars.
# $ export AWS_ACCESS_KEY_ID=<stored-in-1Password>
# $ export AWS_SECRET_ACCESS_KEY=<stored-in-1Password>
# $ export AWS_DEFAULT_REGION=<stored-in-1Password>

locals {
  region = "ap-southeast-1"
}

provider "aws" {
  region = local.region
} #

module "lambda_functions" {
  source = "./modules/lambda-functions"

  lambda_invoke_lambda_role_name = module.roles_permissions.lambda_invoke_lambda_role_name
  lambda_invoke_lambda_role_arn  = module.roles_permissions.lambda_invoke_lambda_role_arn
  lambda_execute_role_name       = module.roles_permissions.lambda_execute_role_name
  lambda_execute_role_arn        = module.roles_permissions.lambda_execute_role_arn
  layer_nlp_arn                  = module.lambda_layers.layer_nlp_arn
  env                            = var.env
}

module "roles_permissions" {
  source = "./modules/roles-permissions"

  s3_lambda_layers_arn = module.lambda_layers.s3_lambda_layers_arn
}

module "lambda_layers" {
  source = "./modules/lambda-layers"

  project_name = var.project_name

}

module "lambda_function_container_images" {
  source = "./modules/lambda-function-container-images"

  lambda_execute_role_arn = module.roles_permissions.lambda_execute_role_arn
  env                     = var.env
  region                  = local.region


}
