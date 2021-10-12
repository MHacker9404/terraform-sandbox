resource "azurerm_mssql_server" "server" {
  name                = "${var.prefix}-mssql-01"
  resource_group_name = azurerm_resource_group.rgp-01.name
  location            = azurerm_resource_group.rgp-01.location

  administrator_login          = "mssql-admin"
  administrator_login_password = var.mssql-password

  version = "12.0"
}