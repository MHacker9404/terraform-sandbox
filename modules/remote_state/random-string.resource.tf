resource "random_string" "storage_account" {
  length = local.rand_length

  lower = true
  number = true
  special = false
  upper = false
}

resource "random_string" "key_vault" {
  length = local.rand_length

  lower = true
  number = true
  special = false
  upper = true
}