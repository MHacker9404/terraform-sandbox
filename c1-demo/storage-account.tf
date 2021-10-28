resource "azurerm_storage_account" "remote_state" {
  name                      = "${lower(var.prefix)}remotestate${replace(var.suffix, "-", "")}"
  resource_group_name       = azurerm_resource_group.rgp_state.name
  location                  = azurerm_resource_group.rgp_state.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_container" "state" {
  name                  = "remote-state"
  storage_account_name  = azurerm_storage_account.remote_state.name
  container_access_type = "private"
}