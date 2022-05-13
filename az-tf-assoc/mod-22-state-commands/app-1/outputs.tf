output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

output "current_subscription_id" {
  value = data.azurerm_subscription.current.id
}

output "resource_group" {
  value = azurerm_resource_group.rg_mod_22
}
