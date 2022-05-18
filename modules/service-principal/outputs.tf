output "svc_principal" {
  value = azuread_service_principal.auth
}

output "svc_principal_password" {
  value = azuread_service_principal_password.auth
  sensitive = true
}
