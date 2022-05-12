resource "azurerm_storage_container" "remote_state" {
  name                  = "remote-state"
  storage_account_name  = azurerm_storage_account.remote_state.name
  container_access_type = "private"
}
