# demo instance 1
resource "azurerm_linux_virtual_machine" "instance_1" {
  name                            = "${var.prefix}-vm-01"
  resource_group_name             = azurerm_resource_group.rgp_01.name
  location                        = azurerm_resource_group.rgp_01.location
  network_interface_ids           = [azurerm_network_interface.net_int_01.id]
  size                            = "Standard_B1s"
  admin_username                  = "demo-admin"
  disable_password_authentication = true
  depends_on = [
    azurerm_storage_account.storage,
    azurerm_key_vault.key_vault
  ]
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
}

resource "azurerm_virtual_machine_extension" "vm_ext_01" {
  name                       = "hostname"
  virtual_machine_id         = azurerm_linux_virtual_machine.instance_1.id
  publisher                  = "Microsoft.Azure.Extensions"
  type                       = "CustomScript"
  type_handler_version       = "2.1"
  auto_upgrade_minor_version = true
  protected_settings         = <<PROTECTED_SETTINGS
    {
    }
  PROTECTED_SETTINGS
}
