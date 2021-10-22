resource "azurerm_key_vault" "state" {
  name                     = "${var.prefix}-state-keyvault"
  resource_group_name      = azurerm_resource_group.rgp_state.name
  location                 = azurerm_resource_group.rgp_state.location
  tenant_id                = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled = true
  soft_delete_retention_days = 7
  sku_name                 = "standard"

  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}

resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id = azurerm_key_vault.state.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = ["get", "create", "list", "update", "delete", "backup", "import", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}

resource "azurerm_key_vault_access_policy" "storage" {
  depends_on = [
    azurerm_storage_account.remote_state
  ]

  key_vault_id = azurerm_key_vault.state.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.remote_state.identity[0].principal_id

  key_permissions    = ["get", "create", "list", "restore", "recover", "unwrapkey", "wrapkey", "purge", "encrypt", "decrypt", "sign", "verify"]
  secret_permissions = ["get"]
}

resource "azurerm_key_vault_key" "state" {
  name         = "${var.prefix}-remote-state"
  key_vault_id = azurerm_key_vault.state.id
  key_type     = "RSA"
  key_size     = 4096

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}
