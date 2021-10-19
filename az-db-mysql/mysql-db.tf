resource "azurerm_mysql_server" "server" {
  name                = "${var.prefix}-mysql-01"
  resource_group_name = azurerm_resource_group.rgp-01.name
  location            = azurerm_resource_group.rgp-01.location

  administrator_login          = "mysql-admin"
  administrator_login_password = var.mysql-password

  sku_name   = "GP_Gen5_2"
  storage_mb = 5120
  version    = "8.0"

  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "db" {
  name                = "training"
  resource_group_name = azurerm_resource_group.rgp-01.name
  server_name         = azurerm_mysql_server.server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_virtual_network_rule" "instance-vnet-rule" {
  name                = "instance-vnet-rule"
  resource_group_name = azurerm_resource_group.rgp-01.name
  server_name         = azurerm_mysql_server.server.name
  subnet_id           = azurerm_subnet.snet-01.id
}

resource "azurerm_mysql_virtual_network_rule" "mysql-vnet-rule" {
  name                = "mysql-vnet-rule"
  resource_group_name = azurerm_resource_group.rgp-01.name
  server_name         = azurerm_mysql_server.server.name
  subnet_id           = azurerm_subnet.snet-02.id
}

resource "azurerm_mysql_firewall_rule" "firewall-rule" {
  name                = "allow-instance"
  resource_group_name = azurerm_resource_group.rgp-01.name
  server_name         = azurerm_mysql_server.server.name
  start_ip_address    = azurerm_network_interface.net-int-01.private_ip_address
  end_ip_address      = azurerm_network_interface.net-int-01.private_ip_address
}