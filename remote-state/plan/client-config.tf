data "azurerm_client_config" "current" {
}

output "client_id" {
    value = data.azurerm_client_config.current.client_id
}

output "tenant_id" {
    value = data.azurerm_client_config.current.tenant_id
}

output "subscription_id" {
    value = data.azurerm_client_config.current.subscription_id
}

output "object_id" {
    value = data.azurerm_client_config.current.object_id
}

# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription
data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}