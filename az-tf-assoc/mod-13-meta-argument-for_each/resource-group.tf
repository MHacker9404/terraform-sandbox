resource "azurerm_resource_group" "rg_mod_13" {
  for_each = random_pet.pets
  name     = "${each.value.id}-RG"
  location = "eastus"
}
