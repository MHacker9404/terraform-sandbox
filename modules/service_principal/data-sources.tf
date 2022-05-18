data "azurerm_client_config" "current" { }

data "azurerm_subscription" "primary" { }

data "azuread_application_published_app_ids" "well_known" {}

output "client_id" {
    value = data.azurerm_client_config.current.client_id
}

output "tenant_id" {
    value = data.azurerm_client_config.current.tenant_id
}

output "subscription_id" {
    value = data.azurerm_client_config.current.subscription_id
}

output "admin_principal_id" {
    value = data.azurerm_client_config.current.object_id
}
