resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${random_pet.pets.id}-VM"
  computer_name       = "linux-VM"
  resource_group_name = azurerm_resource_group.rg_mod_11.name
  location            = azurerm_resource_group.rg_mod_11.location
  size                = "Standard_B1ls"
  # size = "Standard_A1_v2"
  admin_username        = "prb_admin"
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_ssh_key {
    username   = "prb_admin"
    public_key = file("${path.module}/ssh-keys/tf-az.pub")
  }
  os_disk {
    name                 = "${random_pet.pets.id}-OS"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.yaml")
}
