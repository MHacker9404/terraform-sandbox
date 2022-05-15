# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "mylinuxvm" {
  name                  = local.vm_name
  computer_name         = local.vm_name # Hostname of the VM
  resource_group_name   = azurerm_resource_group.rg_mod_26.name
  location              = azurerm_resource_group.rg_mod_26.location
  size                  = "Standard_B1s"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.myvmnic.id]
  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/../ssh-keys/azure-demo.pub")
  }
  os_disk {
    name                 = "osdisk${random_string.os_disk.id}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  #   custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.yaml")
  tags        = local.common_tags
}




