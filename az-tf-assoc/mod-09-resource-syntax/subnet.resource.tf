resource "azurerm_subnet" "snet" {
  name                 = "${random_pet.pets.id}-SNET"
  resource_group_name  = azurerm_resource_group.rg_mod_09.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
