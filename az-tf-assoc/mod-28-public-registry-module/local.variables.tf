locals {
  udemy_module = "mod-28"
  location     = "eastus"
#   rand_length  = 24 - length(var.business_unit) - length(var.environment)

  vnet_name = "${module.label_1.id}-VNET"
}
