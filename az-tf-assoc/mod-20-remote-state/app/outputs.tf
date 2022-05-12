# output "rg_name" {
#   value = data.azurerm_resource_group.ds_rg
# }

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

output "current_subscription_id" {
  value = data.azurerm_subscription.current.id
}
