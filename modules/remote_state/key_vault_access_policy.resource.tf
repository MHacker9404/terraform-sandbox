resource "azurerm_key_vault_access_policy" "ad_group" {
  depends_on = [
    azurerm_key_vault.remote_state,
  ]

  key_vault_id = azurerm_key_vault.remote_state.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azuread_group.ad_group.object_id

  key_permissions         = ["Get", "Create", "List", "Update", "Delete", "Backup", "Import", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
  certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore"]
}

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

resource "azurerm_key_vault_access_policy" "storage" {
  depends_on = [
    azurerm_key_vault.remote_state,
    azurerm_storage_account.remote_state
  ]

  key_vault_id = azurerm_key_vault.remote_state.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.remote_state.identity[0].principal_id

  key_permissions         = ["Get", "Create", "List", "Update", "Delete", "Backup", "Import", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
  certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore"]
}

resource "azurerm_key_vault_access_policy" "svc_principal" {
  depends_on = [
    azurerm_key_vault.remote_state,
    module.service_principal.svc_principal
  ]

  key_vault_id = azurerm_key_vault.remote_state.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.service_principal.svc_principal.object_id

  key_permissions         = ["Get", "Create", "List", "Update", "Delete", "Backup", "Import", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
  certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore"]
}