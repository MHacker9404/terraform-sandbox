include "root" {
  path   = find_in_parent_folders("terragrunt.hcl")
  expose = true
}

generate "cloud-posse-provider" {
  path      = "cloud-posse-provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "awsutils" {
  region = "us-east-1"
}
EOF
}

locals {
  environment_config = read_terragrunt_config(find_in_parent_folders("environment_specific.hcl"))
  environment        = local.environment_config.locals.environment
  region_config      = read_terragrunt_config(find_in_parent_folders("region_specific.hcl"))
  region             = local.region_config.locals.region
}

terraform {
  source    = "github.com/cloudposse/terraform-aws-iam-system-user?ref=0.23.1"
}

inputs = {
  namespace = include.root.locals.namespace
  stage     = local.environment
  name      = "tools"
}
