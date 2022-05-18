module "sp_auth" {
  source      = "../.."
  client      = var.client
  environment = var.environment
  app_name    = var.app_name
  pw_duration = var.pw_duration
  role        = var.role
}
