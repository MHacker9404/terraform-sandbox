locals {
  sp_name     = var.app_name == null ? "SP-${lower(var.client)}${lower(var.environment)}-remote-state" : var.app_name
  pw_duration = "${var.pw_duration}h"
}
