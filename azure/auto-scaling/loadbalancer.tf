resource "azurerm_lb" "demo" {
  name                = "${var.prefix}-lb"
  sku = length(var.zones) == 0 ? "Basic" : "Standard" # basic is free, but doesn't support AZ's
  resource_group_name = azurerm_resource_group.auto-scale-rgp.name
  location            = var.location
  frontend_ip_configuration {
    name                 = "${var.prefix}-pip"
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}

resource "azurerm_lb_probe" "demo" {
  name                = "${var.prefix}-lb-probe"
  resource_group_name = azurerm_resource_group.auto-scale-rgp.name
  loadbalancer_id = azurerm_lb.demo.id
  port = 80
  protocol = "Http"
  request_path = "/"
}

resource "azurerm_lb_backend_address_pool" "be-addr-pool" {
  name                = "${var.prefix}-lb-backend-addr-pool"
  loadbalancer_id = azurerm_lb.demo.id
}

resource "azurerm_lb_nat_pool" "nat-pool" {
  name                = "${var.prefix}-lb-nat-pool"
  resource_group_name = azurerm_resource_group.auto-scale-rgp.name
  loadbalancer_id = azurerm_lb.demo.id
  frontend_ip_configuration_name = "${var.prefix}-pip"
  frontend_port_start = 50000
  frontend_port_end = 50119
  protocol = "Tcp"
  backend_port = 22
}

resource "azurerm_lb_rule" "lb-rule" {
  resource_group_name = azurerm_resource_group.auto-scale-rgp.name
  loadbalancer_id = azurerm_lb.demo.id
  name                           = "lb-rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "${var.prefix}-pip"
  probe_id = azurerm_lb_probe.demo.id
  backend_address_pool_id = azurerm_lb_backend_address_pool.be-addr-pool.id
}