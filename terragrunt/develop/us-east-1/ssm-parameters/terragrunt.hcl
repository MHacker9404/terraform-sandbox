locals {
    environment_config = read_terragrunt_config(find_in_parent_folders("environment_specific.hcl"))
    environment = local.environment_config.locals.environment
    region_config = read_terragrunt_config(find_in_parent_folders("region_specific.hcl"))
    region = local.region_config.locals.region
}

terraform {
  source = "../../../../modules/ssm-parameter"
}

inputs = {
    name = "/prb/${local.environment}/param-1"
    type = "String"
    value = "example value"
}