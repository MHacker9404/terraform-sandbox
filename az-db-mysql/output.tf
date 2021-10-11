output "mysql_fqdn" {
  value = azurerm_mysql_server.server.fqdn
}

output "vm_instance_private_ip" {
    description = "The private IP address allocated for the vm"
    value   =   azurerm_network_interface.net-int-01.private_ip_address
}

output "vm_instance_public_ip" {
    description = "The public IP address allocated for the vm"
    value   =   azurerm_public_ip.pip.ip_address
}