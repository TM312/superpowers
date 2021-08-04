# Terraform

We use a modularized approach to organize the required infrastructure.

## Managed resource

- AWS API Gateway
- as modules
    - [AWS Lambda functions](https://github.com/TM312/superpowers/tree/master/terraform/modules/lambda-functions)
    – [AWS Lambda layers](https://github.com/TM312/superpowers/tree/master/terraform/modules/lambda-layers)
    - [AWS IAM: Roles & Permissions](https://github.com/TM312/superpowers/tree/master/terraform/modules/roles-permissions)
- AWS S3 (for state management) *(soon)*

## Directory Structure

```
.
├── README.md
├── api_gateway.tf      // Definition of AWS API Gateway
├── aws.tf              // Entrypoint for AWS Resources. Modules are loaded from here.
├── environments        // Cross-environment variable definition.
│   ├── common.tfvars   // Shared variables across environments
│   ├── dev
│   ├── prod
│   └── stage
├── main.tf             // Main entrypoint. Defines providers, currently only AWS.
├── modules             // Modules are used for separation of concerns in infrastructure definition.
│   ├── lambda-functions
│   ├── lambda-layers
│   └── roles-permissions
├── outputs.tf          // Outputs are variables that are printed to the console after deployment.
├── terraform.tfstate.d // Terraform state -> To be moved to S3
│   ├── dev
│   └── prod
└── variables.tf        // Top-level variables

```


## Makefile

A `Makefile` located in this directory is used to interact with Terraform. It serves as a reference point to keep track of relevant commands.

## State
As of now the infrastructure state is stored locally. To be changed ASAP.
