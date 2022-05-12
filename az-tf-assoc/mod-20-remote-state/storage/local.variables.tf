locals {
  rand_length = 24 - length(var.client) - length(var.env)
  stg_acct_name = "${lower(var.client)}${lower(var.env)}${random_string.storage_account.result}"
  key_vault_name = "${lower(var.client)}${lower(var.env)}${random_string.key_vault.result}"
}