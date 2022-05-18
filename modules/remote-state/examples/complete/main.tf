module "remote_state" {
  source = "../.."

  location    = var.location
  client      = var.client
  environment = var.environment
  role        = var.role
  group_name  = var.group_name
}
