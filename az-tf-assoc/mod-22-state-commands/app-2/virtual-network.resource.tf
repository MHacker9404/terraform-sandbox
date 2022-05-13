resource "azurerm_virtual_network" "vnet" {
  name                = "${local.udemy_module}-VNET"
  resource_group_name = data.terraform_remote_state.app_1.outputs.resource_group.name
  location            = data.terraform_remote_state.app_1.outputs.resource_group.location
  address_space       = ["10.0.0.0/16"]
}
