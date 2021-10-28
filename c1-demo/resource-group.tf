resource "azurerm_resource_group" "rgp_state" {
  name     = "AZ-GV-DOD-AF-CCE-CDL-L-IL2-${var.prefix}-APP-RGP-01"
  location = var.location
  lifecycle{
    prevent_destroy = true
  }
}
