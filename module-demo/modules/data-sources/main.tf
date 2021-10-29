terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }

  required_version = "~> 1.0.7"
}

provider "azurerm" {
  skip_provider_registration = true
  # Configuration options
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion = true
      graceful_shutdown          = false
    }
  }
  environment = "public"
}