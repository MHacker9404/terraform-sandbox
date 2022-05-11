resource "azurerm_virtual_network" "vnet" {
  name                = "${random_pet.pets.id}-VNET"
  resource_group_name = azurerm_resource_group.rg_mod_12[0].name
  location            = azurerm_resource_group.rg_mod_12[0].location
  address_space       = ["10.0.0.0/16"]
}
