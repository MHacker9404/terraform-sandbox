resource "azurerm_resource_group" "remote_state" {
  name     = "${upper(var.client)}-${upper(var.environment)}-REMOTE-STATE"
  location = var.location
}
