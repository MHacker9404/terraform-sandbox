locals {
  rg_name = "${var.mod_name}-${var.rg_name}"

  vnet_address_space = (var.environment == "dev" ? var.vnet_address_space_dev : var.vnet_address_space_all)
  # vnet_address_space = (var.environment != "dev" ? var.vnet_address_space_all : var.vnet_address_space_dev)
}