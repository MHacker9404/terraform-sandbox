resource "azurerm_virtual_network" "vnet_01" {
  name                = "${var.prefix}-vnet-01"
  resource_group_name = azurerm_resource_group.rgp_01.name
  location            = azurerm_resource_group.rgp_01.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "snet_01" {
  name                 = "${var.prefix}_snet-instance"
  resource_group_name = azurerm_resource_group.rgp_01.name
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  address_prefixes     = ["10.0.0.0/24"]
  service_endpoints = ["Microsoft.Sql"]
}

resource "azurerm_subnet" "snet_02" {
  name                 = "${var.prefix}-snet-database"
  resource_group_name = azurerm_resource_group.rgp_01.name
  virtual_network_name = azurerm_virtual_network.vnet_01.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints = ["Microsoft.Sql"]
}

resource "azurerm_network_security_group" "nsg_01" {
  name                = "${var.prefix}-nsg"
  resource_group_name = azurerm_resource_group.rgp_01.name
  location            = azurerm_resource_group.rgp_01.location
  security_rule {
    name                       = "AllowSshInbound"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = var.ssh_source_address
    source_port_range          = "*"
    destination_port_range     = "22"
    destination_address_prefix = "*"
    description                = "Allow SSH"
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.prefix}-pip"
  resource_group_name = azurerm_resource_group.rgp_01.name
  location            = azurerm_resource_group.rgp_01.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "net_int_01" {
  name                = "${var.prefix}-net-int-01"
  resource_group_name = azurerm_resource_group.rgp_01.name
  location            = azurerm_resource_group.rgp_01.location
  ip_configuration {
    name                          = "net-int-01"
    subnet_id                     = azurerm_subnet.snet_01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_subnet_network_security_group_association" "snet_nsg" {
  subnet_id                 = azurerm_subnet.snet_01.id
  network_security_group_id = azurerm_network_security_group.nsg_01.id
}
