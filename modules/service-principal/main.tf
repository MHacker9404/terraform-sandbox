resource "azuread_application" "auth" {
  display_name = local.sp_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "auth" {
  application_id = azuread_application.auth.application_id
  owners         = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal_password" "auth" {
  service_principal_id = azuread_service_principal.auth.id
  end_date_relative    = local.pw_duration
}

resource "azurerm_role_assignment" "auth" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = var.role
  principal_id         = azuread_service_principal.auth.id
}
