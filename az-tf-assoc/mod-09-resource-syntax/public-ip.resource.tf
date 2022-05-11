resource "azurerm_public_ip" "pip" {
  name                = "${random_pet.pets.id}-PIP"
  resource_group_name = azurerm_resource_group.rg_mod_09.name
  location            = azurerm_resource_group.rg_mod_09.location
  allocation_method   = "Dynamic"
}
