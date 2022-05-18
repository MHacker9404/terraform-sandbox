output "svc_principal" {
  value = module.sp_auth.svc_principal
}

output "svc_principal_password" {
  value     = module.sp_auth.svc_principal_password
  sensitive = true
}