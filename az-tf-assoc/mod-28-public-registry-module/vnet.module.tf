module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "2.6.0"

  resource_group_name = azurerm_resource_group.rg_mod_28.name

  vnet_name = local.vnet_name

  address_space   = ["10.0.0.0/16"]
  subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names    = ["subnet1", "subnet2", "subnet3"]

  subnet_service_endpoints = {
    subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
    subnet3 = ["Microsoft.AzureActiveDirectory"]
  }

  tags = merge(module.label_1.tags, { Name = local.vnet_name })

  depends_on = [azurerm_resource_group.rg_mod_28]
}
