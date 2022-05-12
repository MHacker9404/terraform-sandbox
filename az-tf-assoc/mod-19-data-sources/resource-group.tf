resource "azurerm_resource_group" "rg_mod_17" {
  name     = "${local.udemy_module}-RG"
  location = local.location
}
