locals {
  udemy_module = "mod-20"
  location     = "eastus"
  rg_name      = "${local.udemy_module}-storage-RG"
  stg_name     = "prb${udemy_module_mod}stg"
}

udemy_module_mod = lower(replace(local.udemy_module, "-", ""))
