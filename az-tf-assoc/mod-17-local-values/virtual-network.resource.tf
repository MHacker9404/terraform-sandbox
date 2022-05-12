# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  #name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  name                = local.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_mod_17.id
  resource_group_name = azurerm_resource_group.rg_mod_17.name
  tags = local.common_tags
}
