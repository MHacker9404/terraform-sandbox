resource "azurerm_resource_group" "rgp_state" {
  name     = "${var.prefix}-remote-state"
  location = var.location
}
