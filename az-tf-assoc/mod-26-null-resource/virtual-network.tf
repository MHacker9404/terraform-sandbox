# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = local.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_mod_26.location
  resource_group_name = azurerm_resource_group.rg_mod_26.name
  tags = local.common_tags
}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = local.snet_name
  resource_group_name = azurerm_resource_group.rg_mod_26.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                = local.pip_name
  location            = azurerm_resource_group.rg_mod_26.location
  resource_group_name = azurerm_resource_group.rg_mod_26.name
  allocation_method   = "Static"
#   domain_name_label = "app1-${terraform.workspace}-${random_string.domain_name.id}"
  tags = local.common_tags
}

# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  name                = local.nic_name
  location            = azurerm_resource_group.rg_mod_26.location
  resource_group_name = azurerm_resource_group.rg_mod_26.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id 
  }
  tags = local.common_tags
}
