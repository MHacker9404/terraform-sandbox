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
