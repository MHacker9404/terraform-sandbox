resource "azurerm_key_vault_key" "remote_state" {
  depends_on = [
    azurerm_key_vault.remote_state,
    azurerm_key_vault_access_policy.client,
    azurerm_key_vault_access_policy.storage,
    azurerm_key_vault_access_policy.svc_principal
  ]

  name         = "remote-state"
  key_vault_id = azurerm_key_vault.remote_state.id
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
