resource "azurerm_virtual_network" "vnet-01" {
  name                = "${var.prefix}-vnet-01"
  resource_group_name = azurerm_resource_group.auto-scale-rgp.name
  location            = azurerm_resource_group.auto-scale-rgp.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "snet-01" {
  name                 = "${var.prefix}-snet-01"
  resource_group_name  = azurerm_resource_group.auto-scale-rgp.name
  virtual_network_name = azurerm_virtual_network.vnet-01.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_security_group" "nsg-vmss" {
  name                = "${var.prefix}-nsg-vmss"
  resource_group_name = azurerm_resource_group.auto-scale-rgp.name
  location            = azurerm_resource_group.auto-scale-rgp.location
  security_rule {
    name                       = "AllowHttpInbound"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_port_range     = "80"
    destination_address_prefix = "*"
    description                = "Allow HTTP"
  }
  security_rule {
    name                       = "AllowSshInbound"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = var.ssh-source-address
    source_port_range          = "*"
    destination_port_range     = "22"
    destination_address_prefix = "*"
    description                = "Allow SSH"
  }
}

resource "azurerm_public_ip" "pip" {
  name                = "${var.prefix}-pip"
  resource_group_name = azurerm_resource_group.auto-scale-rgp.name
  location            = azurerm_resource_group.auto-scale-rgp.location
  allocation_method   = "Static"
  domain_name_label   = azurerm_resource_group.auto-scale-rgp.name
  sku                 = length(var.zones) == 0 ? "Basic" : "Standard" # basic is free, but doesn't support AZ's
}

# resource "azurerm_subnet_network_security_group_association" "snet-nsg" {
#   subnet_id                 = azurerm_subnet.snet-01.id
#   network_security_group_id = azurerm_network_security_group.nsg-vmss.id
# }
