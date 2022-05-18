resource "azuread_service_principal_password" "auth" {
  service_principal_id = azuread_service_principal.auth.id
  end_date_relative    = local.pw_duration
}
