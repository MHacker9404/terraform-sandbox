locals {
  rand_length = 24 - length(var.client) - length(var.environment)

  stg_acct_name = "${lower(var.client)}${lower(var.environment)}${random_string.storage_account.result}"
  key_vault_name = "${lower(var.client)}${lower(var.environment)}${random_string.key_vault.result}"

  sp_name     = var.app_name == null ? "SP-${lower(var.client)}${lower(var.environment)}-remote-state" : var.app_name
  pw_duration = "${var.pw_duration}h"
}