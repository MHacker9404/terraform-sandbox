resource "azurerm_resource_group" "rgp-01" {
  name     = "${var.prefix}-rgp-01"
  location = var.location
  tags = {
    env = "resource-group-demo"
    impact-level = "IL2"
  }
}
