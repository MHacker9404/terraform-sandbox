resource "azurerm_storage_account_customer_managed_key" "remote_state" {
  depends_on = [
    azurerm_key_vault_access_policy.storage
  ]

  storage_account_id = azurerm_storage_account.remote_state.id
  key_vault_id       = azurerm_key_vault.remote_state.id
  key_name           = azurerm_key_vault_key.remote_state.name
}
