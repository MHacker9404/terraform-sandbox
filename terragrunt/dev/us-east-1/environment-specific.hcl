include "root" {
  path = find_in_parent_folders()
}


locals {
    region = "us-east-1"

    environment_config = read_terragrunt_config(find_in_parent_folders("environment_specific.hcl"))
    environment = local.environment_config.locals.environment
}