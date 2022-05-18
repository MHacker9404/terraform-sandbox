resource "azurerm_role_assignment" "auth" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = var.role
  principal_id         = azuread_service_principal.auth.id
}