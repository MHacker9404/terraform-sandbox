resource "azurerm_resource_group" "rg_mod_07_west" {
  name     = "rg-mod-07-west"
  location = "westus"
  provider = azurerm.azurerm-us-west
}
