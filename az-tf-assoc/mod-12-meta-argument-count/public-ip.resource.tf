resource "azurerm_public_ip" "pip" {
  count = 2
  name                = "${random_pet.pets.id}-PIP-${count.index}"
  resource_group_name = azurerm_resource_group.rg_mod_12[0].name
  location            = azurerm_resource_group.rg_mod_12[0].location
  allocation_method   = "Dynamic"
}
