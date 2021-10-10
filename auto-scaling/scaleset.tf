resource "azurerm_linux_virtual_machine_scale_set" "scaleset" {
  name                            = "${var.prefix}-vmss"
  location                        = var.location
  resource_group_name             = azurerm_resource_group.auto-scale-rgp.name
  sku                             = "Standard_B1s"
  instances                       = 1
  admin_username                  = "demo-user"
  disable_password_authentication = true
  zones           = var.zones
  health_probe_id = azurerm_lb_probe.demo.id

  admin_ssh_key {
    username   = "demo-user"
    public_key = file("../mykey.pub")
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  custom_data     = filebase64("custom-data.sh")
  computer_name_prefix = "${var.prefix}-vm"

  data_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = 10
    lun                  = 0
  }

  automatic_os_upgrade_policy {
    enable_automatic_os_upgrade = true
    disable_automatic_rollback  = false
  }

  upgrade_mode = "Automatic"
  rolling_upgrade_policy {
    max_batch_instance_percent              = 20
    max_unhealthy_instance_percent          = 20
    max_unhealthy_upgraded_instance_percent = 5
    pause_time_between_batches              = "PT0S"
  }

  network_interface {
    name    = "${var.prefix}-net-int-vmss"
    primary = true
    network_security_group_id = azurerm_network_security_group.nsg-vmss.id
    ip_configuration {
      name      = "${var.prefix}-internal"
      primary   = true
      subnet_id = azurerm_subnet.snet-01.id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.be-addr-pool.id]
      load_balancer_inbound_nat_rules_ids = [azurerm_lb_nat_pool.nat-pool.id]
    }
  }
}
