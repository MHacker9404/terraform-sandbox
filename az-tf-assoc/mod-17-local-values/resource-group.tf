resource "azurerm_resource_group" "rg_mod_17" {
  name     = local.rg_name
  location = var.resource_group_location
}
