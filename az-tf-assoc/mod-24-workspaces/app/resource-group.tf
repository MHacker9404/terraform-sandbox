resource "azurerm_resource_group" "rg_mod_24" {
  name     = "${local.udemy_module}-RG"
  location = local.location
}
