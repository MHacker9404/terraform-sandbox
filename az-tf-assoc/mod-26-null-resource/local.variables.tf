locals {
  udemy_module = "mod-26"
  location     = "eastus"
  rand_length = 24 - length(var.business_unit) - length(var.environment)
  vnet_name    = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  snet_name    = "${var.business_unit}-${var.environment}-${var.subnet_name}"
  pip_name     = "${var.business_unit}-${var.environment}-${var.publicip_name}"
  nic_name     = "${var.business_unit}-${var.environment}-${var.network_interface_name}"
  vm_name      = "${var.business_unit}-${var.environment}-${var.virtual_machine_name}"

  common_tags = {}
}
