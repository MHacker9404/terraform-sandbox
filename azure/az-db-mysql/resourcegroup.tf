resource "azurerm_resource_group" "rgp-01" {
  name     = "${var.prefix}-az-db-mysql"
  location = var.location
  tags = {
    module = "azure-services"
    scenario = "az-db-mysql"
  }
}
