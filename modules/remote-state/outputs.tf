output "resource_group" {
  value = {
    name = azurerm_resource_group.remote_state.name
    location = azurerm_resource_group.remote_state.location
  }
}
output "storage_account" {
    value = azurerm_storage_account.remote_state.name
}
output "blob_container" {
    value = azurerm_storage_container.remote_state.name
}
output "key_vault" {
    value = azurerm_key_vault.remote_state.name
}