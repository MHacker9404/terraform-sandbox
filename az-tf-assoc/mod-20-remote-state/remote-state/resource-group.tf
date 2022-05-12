resource "azurerm_resource_group" "remote_state" {
  name     = local.rg_name
  location = local.location
}
