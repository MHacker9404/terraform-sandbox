locals {
    terraform_config = read_terragrunt_config(find_in_parent_folders("terraform_config.hcl"))
    environment_config = read_terragrunt_config(find_in_parent_folders("environment_specific.hcl"))
    environment = local.environment_config.locals.environment
    region = local.environment_config.locals.region
}

terraform {
  source = "../../../../modules/ssm-paramter"
}

include "root" {
  path = find_in_parent_folders()
}

inputs {
    # name
    # type
    # value
}