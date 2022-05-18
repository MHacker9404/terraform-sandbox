resource "azuread_service_principal" "auth" {
  application_id = azuread_application.auth.application_id
  # owners         = [data.azuread_client_config.current.object_id]
}