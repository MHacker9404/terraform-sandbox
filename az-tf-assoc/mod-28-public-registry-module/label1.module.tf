module "label_1" {
  source  = "cloudposse/label/null"
  version = "0.25.0" # requires Terraform >= 0.13.0

  context = module.this.context

  label_order         = ["namespace", "tenant", "environment", "stage", "name", "attributes"]

  namespace   = "PRB"
  environment = local.udemy_module
  tenant = "tenant"
  stage = "UAT"
}
