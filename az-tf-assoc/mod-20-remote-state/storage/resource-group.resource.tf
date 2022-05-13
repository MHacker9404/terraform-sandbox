resource "azurerm_resource_group" "remote_state" {
  name     = "${upper(var.tenant)}-${upper(var.env)}-REMOTE-STATE"
  location = var.location
}
