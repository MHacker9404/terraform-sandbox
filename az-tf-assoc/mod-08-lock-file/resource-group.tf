resource "azurerm_resource_group" "rg_mod_08" {
  name = "${random_pet.pets.id}-RG"
  location = "eastus"
}