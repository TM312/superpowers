# Each Terraform configuration can specify a backend, which defines where and how operations are performed, where state snapshots are stored, etc.
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
