resource "azurerm_resource_group" "rg_mod_11" {
  name = "${random_pet.pets.id}-RG"
  location = "eastus"
}