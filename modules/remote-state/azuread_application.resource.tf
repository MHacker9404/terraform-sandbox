resource "azuread_application" "auth" {
  display_name = local.sp_name
  owners       = [data.azuread_client_config.current.object_id]
}
