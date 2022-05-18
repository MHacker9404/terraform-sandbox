output "svc_principal" {
  value = azuread_service_principal.auth
}

output "app" {
  value = azuread_application.auth
}

output "sp_password" {
  value     = azuread_service_principal_password.auth.value
  sensitive = true
}

output "app_password" {
  value     = azuread_application_password.auth.value
  sensitive = true
}
