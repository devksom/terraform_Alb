terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region                   = var.aws_region
  shared_config_files      = ["/Users/steps/.aws/config"]
  shared_credentials_files = ["/Users/steps/.aws/credentials"]
  profile                  = "myvscode"
}
