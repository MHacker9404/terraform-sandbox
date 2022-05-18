resource "azurerm_key_vault_access_policy" "client" {
  depends_on = [
    azurerm_key_vault.remote_state
  ]

  key_vault_id = azurerm_key_vault.remote_state.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = ["Get", "Create", "List", "Update", "Delete", "Backup", "Import", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
  certificate_permissions =  ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore"]
}
