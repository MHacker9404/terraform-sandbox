resource "azurerm_virtual_network" "vnet" {
  name                = "${random_pet.pets.id}-VNET"
  resource_group_name = "${random_pet.pets.id}-RG"
  location            = "eastus"
  address_space       = ["10.0.0.0/16"]

  depends_on = [
    azurerm_resource_group.rg_mod_10
  ]
}
