resource "azurerm_network_interface" "nic" {
  name                = "${random_pet.pets.id}-NIC"
  resource_group_name = azurerm_resource_group.rg_mod_11.name
  location            = azurerm_resource_group.rg_mod_11.location
  ip_configuration {
    name                          = "${random_pet.pets.id}-NIC-IP"
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}
