terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.79.1"
    }
  }
  required_version = "=1.0.7"
}

provider "azurerm" {
  # Configuration options
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    virtual_machine {
      delete_os_disk_on_deletion = true
      graceful_shutdown = false
    }
  }
  environment = "public"
}
