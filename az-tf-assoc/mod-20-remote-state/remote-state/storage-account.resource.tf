resource "azurerm_storage_account" "remote_state" {
  name                     = local.stg_name
  resource_group_name      = azurerm_resource_group.remote_state.name
  location                 = azurerm_resource_group.remote_state.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
