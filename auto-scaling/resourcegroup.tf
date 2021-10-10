resource "azurerm_resource_group" "auto-scale-rgp" {
  name     = "${var.prefix}-rgp-01"
  location = var.location
  tags = {
    env = "demo"
    impact-level = "IL2"
  }
}
