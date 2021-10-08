# demo instance
resource "azurerm_virtual_machine" "demo-instance" {
  name                  = "${var.prefix}-vm"
  resource_group_name   = azurerm_resource_group.rgp-01.name
  location              = azurerm_resource_group.rgp-01.location
  network_interface_ids = [azurerm_network_interface.net-int.id]
  vm_size               = "Standard_B1s"

  # this is a demo instance, so we can delete all data on termination
  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.prefix}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.prefix}-vm"
    admin_username = "demo"
    # admin_password = "..."
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("mykey.pub")
      path     = "/home/demo/.ssh/authorized_keys"
    }
  }
}
