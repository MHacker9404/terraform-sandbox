terraform {
  required_version = ">= 1.1.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.5.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    key_vault {
      purge_soft_delete_on_destroy       = true
      recover_soft_deleted_key_vaults    = true
      purge_soft_deleted_keys_on_destroy = true
    }
  }
}
