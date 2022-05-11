resource "azurerm_resource_group" "rg_mod_10" {
  name = "${random_pet.pets.id}-RG"
  location = "eastus"
}