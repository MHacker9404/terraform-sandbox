# demo instance 1
resource "azurerm_linux_virtual_machine" "instance-1" {
  name                            = "${var.prefix}-vm-01"
  resource_group_name             = azurerm_resource_group.rgp-01.name
  location                        = azurerm_resource_group.rgp-01.location
  network_interface_ids           = [azurerm_network_interface.net-int-01.id]
  size                            = "Standard_B1s"
  admin_username                  = "demo-admin"
  disable_password_authentication = true
  admin_ssh_key {
    username   = "demo-admin"
    public_key = file("../mykey.pub")
  }
  os_disk {
    name                 = "${var.prefix}-osdisk-vm-01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  custom_data = filebase64("custom-data.sh")
}
