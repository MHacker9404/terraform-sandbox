data "azurerm_resource_group" "res_grp" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.res_grp.name
}

data "azurerm_subnet" "snet" {
  name                 = var.snet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name = data.azurerm_resource_group.res_grp.name
}

data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = data.azurerm_resource_group.res_grp.name
}
