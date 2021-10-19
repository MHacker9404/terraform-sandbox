resource "azurerm_resource_group" "rgp_01" {
  name     = "${var.prefix}-az-db-mssql"
  location = var.location
  tags = {
    module = "azure_services"
    scenario = "az_db_mssql"
  }
}
