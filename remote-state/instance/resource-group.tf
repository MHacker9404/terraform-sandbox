
resource "azurerm_resource_group" "app-01" {
  name     = "${var.prefix}-app-01"
  location = var.location
}

output "resource_group_id" {
    value = azurerm_resource_group.app-01.id
}

output "resource_group_name" {
    value = azurerm_resource_group.app-01.name
}

output "resource_group_location" {
    value = azurerm_resource_group.app-01.location
}