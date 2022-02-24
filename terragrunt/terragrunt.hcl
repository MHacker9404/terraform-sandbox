terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "4.2.0"
#     }
#   }

#   required_version = ">= 1.1.6"

#   extra_arguments "common_vars" {
#     commands = get_terraform_commands_that_need_vars()

#     arguments = [
#       "-var-file=../../common.tfvars",
#       "-var-file=../region.tfvars"
#     ]
#   }
}

locals {
#   environment_config = read_terragrunt_config(find_in_parent_folders("environment_specific.hcl"))  
#   environment = local.environment_config.locals.environment
#   region = local.environment_config.locals.region
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "prb-remote-state"

    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "prb-remote-state"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
  profile = "PRB-Tools-East1"
}
EOF
}
