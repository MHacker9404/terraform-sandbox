resource "azuread_application_password" "auth" {
  application_object_id = azuread_application.auth.object_id
}