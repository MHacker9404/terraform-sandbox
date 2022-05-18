resource "azurerm_key_vault" "remote_state" {
  name                       = local.key_vault_name
  resource_group_name        = azurerm_resource_group.remote_state.name
  location                   = azurerm_resource_group.remote_state.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled   = true
  soft_delete_retention_days = 7
  sku_name                   = "standard"

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}
