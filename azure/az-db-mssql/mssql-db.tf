resource "azurerm_mssql_server" "server" {
  name                = "${var.prefix}-mssql-01"
  resource_group_name = azurerm_resource_group.rgp_01.name
  location            = azurerm_resource_group.rgp_01.location

  administrator_login          = "mssql-admin"
  administrator_login_password = var.mssql_password

  version = "12.0"
  minimum_tls_version = "1.2"
}