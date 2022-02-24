include "root" {
  path = find_in_parent_folders()
}


locals {
  environment_config = read_terragrunt_config(find_in_parent_folders("environment_specific.hcl"))
}

inputs = {
  region = "us-east-1"
  environment = local.environment_config.inputs.environment
}
