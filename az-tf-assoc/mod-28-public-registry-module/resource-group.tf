resource "azurerm_resource_group" "rg_mod_28" {
  name     = module.label_1.id
  location = local.location
}
