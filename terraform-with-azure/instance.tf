# demo instance 1
resource "azurerm_linux_virtual_machine" "demo-instance-1" {
  name                  = "${var.prefix}-vm-1"
  resource_group_name   = azurerm_resource_group.rgp-01.name
  location              = azurerm_resource_group.rgp-01.location
  network_interface_ids = [azurerm_network_interface.net-int-1.id]
  size                  = "Standard_B1s"
  admin_username        = "demo"
  admin_ssh_key {
    username   = "demo"
    public_key = file("../mykey.pub")
  }
  os_disk {
    name                 = "${var.prefix}-osdisk-vm-1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

# demo instance 2
resource "azurerm_linux_virtual_machine" "demo-instance-2" {
  name                  = "${var.prefix}-vm-2"
  resource_group_name   = azurerm_resource_group.rgp-01.name
  location              = azurerm_resource_group.rgp-01.location
  network_interface_ids = [azurerm_network_interface.net-int-2.id]
  size                  = "Standard_B1s"
  admin_username        = "demo"
  admin_ssh_key {
    username   = "demo"
    public_key = file("../mykey.pub")
  }
  os_disk {
    name                 = "${var.prefix}-osdisk-vm-2"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
