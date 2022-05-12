resource "azurerm_key_vault_access_policy" "storage" {
  depends_on = [
    azurerm_storage_account.remote_state
  ]

  key_vault_id = azurerm_key_vault.remote_state.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.remote_state.identity[0].principal_id

  key_permissions    = ["Get", "Create", "List", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions = ["Get"]
}
