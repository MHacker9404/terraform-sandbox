resource "azurerm_resource_group" "rg_mod_07_east" {
  name = "rg-mod-07-east"
  location = "eastus"
  provider = azurerm.azurerm-us-east
}
