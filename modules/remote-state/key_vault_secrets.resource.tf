resource "azurerm_key_vault_secret" "client_id" {
  depends_on = [
    azurerm_key_vault_access_policy.svc_principal,
    azurerm_key_vault_access_policy.storage,
    azurerm_key_vault_access_policy.client,
    azurerm_key_vault_access_policy.ad_group
  ]

  name         = "client-id"
  value        = azuread_application.auth.application_id
  key_vault_id = azurerm_key_vault.remote_state.id
}

resource "azurerm_key_vault_secret" "client_secret" {
  depends_on = [
    azurerm_key_vault_access_policy.svc_principal,
    azurerm_key_vault_access_policy.storage,
    azurerm_key_vault_access_policy.client,
    azurerm_key_vault_access_policy.ad_group
  ]

  name         = "client-secret"
  value        = azuread_application_password.auth.value
  key_vault_id = azurerm_key_vault.remote_state.id
}
