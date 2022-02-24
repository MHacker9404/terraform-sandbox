include "root" {
  path = find_in_parent_folders()
}

locals {
    terraform_config = read_terragrunt_config(find_in_parent_folders("terraform_config.hcl"))
    environment_config = read_terragrunt_config(find_in_parent_folders("environment_specific.hcl"))
    environment = local.environment_config.inputs.environment
    region = local.environment_config.inputs.region
}

terraform {
  source = "../../../../modules/ssm-parameter"
}

inputs = {
    name = "/prb/${local.environment}/param-1"
    type = "String"
    value = "example value"
}