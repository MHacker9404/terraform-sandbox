resource "azurerm_resource_group" "remote_state" {
  name     = "${upper(var.client)}-${upper(var.env)}-REMOTE-STATE"
  location = var.location
}
