resource "azurerm_network_interface" "nic" {
  count = 2
  name                = "${random_pet.pets.id}-NIC-${count.index}"
  resource_group_name = azurerm_resource_group.rg_mod_12[0].name
  location            = azurerm_resource_group.rg_mod_12[0].location
  ip_configuration {
    name                          = "${random_pet.pets.id}-NIC-IP"
    subnet_id                     = azurerm_subnet.snet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[count.index].id
  }
}
