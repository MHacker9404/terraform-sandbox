resource "azurerm_storage_account" "remote_state" {
  # 3-24 char
  name                      = local.stg_acct_name
  resource_group_name       = azurerm_resource_group.remote_state.name
  location                  = azurerm_resource_group.remote_state.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"

  identity {
    type = "SystemAssigned"
  }

  blob_properties {
    versioning_enabled = true
  }
}

resource "azurerm_storage_container" "remote_state" {
  name                  = "remote-state"
  storage_account_name  = azurerm_storage_account.remote_state.name
  container_access_type = "private"
}

resource "azurerm_storage_account_customer_managed_key" "remote_state" {
  depends_on = [
    azurerm_key_vault.remote_state,
    azurerm_key_vault_access_policy.storage
  ]

  storage_account_id = azurerm_storage_account.remote_state.id
  key_vault_id       = azurerm_key_vault.remote_state.id
  key_name           = azurerm_key_vault_key.remote_state.name
}
