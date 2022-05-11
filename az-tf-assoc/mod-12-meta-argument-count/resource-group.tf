resource "azurerm_resource_group" "rg_mod_12" {
  count = 3
  name     = "${random_pet.pets.id}-RG-${count.index}"
  location = "eastus"
}
