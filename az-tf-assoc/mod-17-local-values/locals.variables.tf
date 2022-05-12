locals {
  rg_name = "${var.mod_name}-${var.environment}-${var.resource_group_name}-RG"
  vnet_name = "${var.mod_name}-${var.environment}-${var.virtual_network_name}-VNET"
  common_tags = {
    Environment = "DEV"
  }
}
