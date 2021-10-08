resource "azurerm_virtual_network" "vnet-01" {
  name                = "${var.prefix}-vnet-01"
  resource_group_name = azurerm_resource_group.rgp-01.name
  location            = azurerm_resource_group.rgp-01.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "snet-01" {
  name                 = "${var.prefix}-snet-01"
  resource_group_name  = azurerm_resource_group.rgp-01.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "allow-ssh" {
  name                = "${var.prefix}-nsg-allow-ssh"
  resource_group_name = azurerm_resource_group.rgp-01.name
  location            = azurerm_resource_group.rgp-01.location
  security_rule {
    name                       = "AllowSshInbound"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.ssh-source-address
    destination_address_prefix = "*"
    description                = "Allow SSH"
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.prefix}-pip"
  resource_group_name = azurerm_resource_group.rgp-01.name
  location            = azurerm_resource_group.rgp-01.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "net-int-1" {
  name                = "${var.prefix}-net-int-1"
  resource_group_name = azurerm_resource_group.rgp-01.name
  location            = azurerm_resource_group.rgp-01.location
  ip_configuration {
    name                          = "net-int-1"
    subnet_id                     = azurerm_subnet.snet-01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}
resource "azurerm_network_interface" "net-int-2" {
  name                = "${var.prefix}-net-int-2"
  resource_group_name = azurerm_resource_group.rgp-01.name
  location            = azurerm_resource_group.rgp-01.location
  ip_configuration {
    name                          = "net-int-2"
    subnet_id                     = azurerm_subnet.snet-01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_interface_application_security_group_association" "asg-1" {
  network_interface_id          = azurerm_network_interface.net-int-1.id
  application_security_group_id = azurerm_application_security_group.asg-1.id
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.snet-01.id
  network_security_group_id = azurerm_network_security_group.allow-ssh.id
}
