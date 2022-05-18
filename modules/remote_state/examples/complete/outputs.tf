output "resource_group" {
  value = module.remote_state.resource_group.name
}
output "storage_account" {
  value = module.remote_state.storage_account
}
output "key_vault" {
  value = module.remote_state.key_vault
}