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

resource "random_string" "os_disk" {
  length = local.rand_length

  lower = true
  number = true
  special = false
  upper = true
}

resource "random_string" "domain_name" {
  length = 6
  upper = false 
  special = false
  number = false   
}